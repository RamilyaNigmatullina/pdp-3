module Admin
  class RejectedPostsController < BaseController
    expose_decorated :posts, -> { Post.rejected.page(params[:page]) }

    def index
    end

    private

    def authorize_resource!
      authorize! Post, with: PendingPostPolicy
    end
  end
end
