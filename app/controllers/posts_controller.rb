class PostsController < ApplicationController
  expose_decorated :posts, :fetch_posts
  expose_decorated :post

  skip_verify_authorized only: %i[index show]

  helper_method :search_params

  def index
  end

  def show
  end

  private

  def filtered_posts
    FilteredPosts.new(Post.includes(:user, :taggings).published, search_params).all
  end

  def fetch_posts
    filtered_posts.order(created_at: :desc).page(params[:page])
  end

  def search_params
    params.fetch(:search, {}).permit(:tags).to_h
  end
end
