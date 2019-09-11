class PostsController < ApplicationController
  DEFAULT_SORT_ORDER = "recent".freeze

  expose_decorated :posts, :fetch_posts
  expose_decorated :post
  expose :like, :fetch_like
  expose :search_form, -> { SearchForm.new(search_form_params) }

  respond_to :json

  skip_verify_authorized only: %i[index show]

  def index
    respond_with posts
  end

  def show
  end

  private

  def filtered_posts
    FilteredPosts.new(Post.includes(:user, :taggings).published, search_form_params.to_h).all
  end

  def fetch_posts
    filtered_posts.send(sort_order).page(params[:page])
  end

  def fetch_like
    current_user.likes.find_by(post: post)
  end

  def search_form_params
    params.fetch(:search_form, {}).permit(:tags, :order)
  end

  def sort_order
    search_form_params[:order] || DEFAULT_SORT_ORDER
  end
end
