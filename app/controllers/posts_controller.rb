class PostsController < ApplicationController
  expose_decorated :posts, :fetch_posts
  expose_decorated :post
  expose :like, :fetch_like

  respond_to :json

  helper_method :search_form_params

  skip_verify_authorized only: %i[index show]

  def index
    respond_to do |format|
      format.html
      format.json { respond_with posts }
    end
  end

  def show
  end

  private

  def filtered_posts
    FilteredPosts.new(Post.includes(:user, :taggings).published, search_form_params).all
  end

  def fetch_posts
    filtered_posts.send(sort_order).page(params[:page])
  end

  def fetch_like
    current_user.likes.find_by(post: post)
  end

  def search_form_params
    params.fetch(:search_form, {}).permit(:tags, :order).to_h
  end

  def sort_order
    search_form_params[:order]
  end
end
