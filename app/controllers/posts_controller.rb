class PostsController < ApplicationController
  expose_decorated :posts, -> { Post.order(:created_at).page(params[:page]) }
  expose_decorated :post

  skip_verify_authorized only: %i[index show]

  def index
  end

  def show
  end
end
