module Users
  module Posts
    class LikesController < ApplicationController
      expose :like, :fetch_like
      expose :post

      skip_verify_authorized only: %i[create destroy]

      def create
        current_user.likes.create(post: post)

        redirect_to post_path(post)
      end

      def destroy
        like.destroy

        redirect_to post_path(post)
      end

      private

      def fetch_like
        current_user.likes.find_by(post: post)
      end
    end
  end
end
