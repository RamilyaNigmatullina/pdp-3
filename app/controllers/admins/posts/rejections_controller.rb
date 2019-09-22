module Admins
  module Posts
    class RejectionsController < BaseController
      expose_decorated :post

      def create
        post.reject
        send_email if post.save

        respond_with :post, location: post_path(post)
      end

      private

      def send_email
        ApplicationMailer.post_rejected(post).deliver_later
      end

      def authorize_resource!
        authorize! post, to: :update?, with: PendingPostPolicy
      end
    end
  end
end
