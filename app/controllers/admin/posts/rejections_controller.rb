module Admin
  module Posts
    class RejectionsController < BaseController
      expose_decorated :post

      def create
        post.reject
        post.save

        respond_with :post, location: post_path(post)
      end

      private

      def authorize_resource!
        authorize! post, to: :update?, with: PendingPostPolicy
      end
    end
  end
end
