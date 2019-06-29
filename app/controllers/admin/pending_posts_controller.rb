module Admin
  class PendingPostsController < BaseController
    expose_decorated :posts, -> { Post.pending.page(params[:page]) }

    def index
    end

    private

    def authorize_resource!
      authorize! Post, with: PendingPostPolicy
    end
  end
end
