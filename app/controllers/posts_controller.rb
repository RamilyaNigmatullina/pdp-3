class PostsController < ApplicationController
  expose_decorated :posts, :fetch_posts
  expose_decorated :post
  expose :like, :fetch_like
  expose :search_form, -> { SearchForm.new(search_form_params) }

  skip_verify_authorized only: %i[index show]

  def index
  end

  def show
  end

  private

  def filtered_posts
    FilteredPosts.new(Post.includes(:user, :taggings).published, search_form_params.to_h).all
  end

  def fetch_posts
    filtered_posts.order(created_at: :desc).page(params[:page])
  end

  def fetch_like
    current_user.likes.find_by(post: post)
  end

  def search_form_params
    params.fetch(:search_form, {}).permit(:tags)
  end
end
