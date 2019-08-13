class PostsController < ApplicationController
  DEFAULT_SORT_ORDER = "recent".freeze

  expose_decorated :posts, :fetch_posts
  expose_decorated :post
  expose :like, :fetch_like
  expose :search_form, -> { SearchForm.new(search_form_params) }

  skip_verify_authorized only: %i[index show]

  def index
    respond_to do |format|
      format.html
      format.json { render json: posts, each_serializer: PostSerializer }
    end
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
    params.fetch(:search_form, {}).permit(:tags)
  end

  def sort_order
    params[:sort_order] || DEFAULT_SORT_ORDER
  end
end
