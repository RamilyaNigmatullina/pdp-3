module Users
  module Posts
    class LikesController < ApplicationController
      expose :like, parent: :post
      expose :post

      skip_verify_authorized only: %i[create destroy]

      def create
        like.user = current_user
        like.save

        redirect_to post_path(post)
      end

      def destroy
        like.destroy

        redirect_to post_path(post)
      end
    end
  end
end
