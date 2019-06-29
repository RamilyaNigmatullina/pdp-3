module Admin
  module Posts
    class ApprovalsController < BaseController
      expose_decorated :post

      def create
        post.publish
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
