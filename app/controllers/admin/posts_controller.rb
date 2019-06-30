module Admin
  class PostsController < BaseController
    expose_decorated :post

    def new
    end

    def create
      post.user = current_user
      post.save

      respond_with post, location: post_path(post)
    end

    def edit
    end

    def update
      post.update(post_params)

      respond_with post
    end

    def destroy
      post.destroy

      respond_with post
    end

    private

    def post_params
      params.require(:post).permit(:title, :body)
    end

    def authorize_resource!
      authorize! post
    end
  end
end
