class SubscribersController < ApplicationController
  expose :subscriber, find_by: :email

  skip_verify_authorized only: %i[create destroy]

  def create
    respond_to do |format|
      if subscriber.save
        format.js { flash.now[:notice] = t(".notice") }
      else
        format.js do
          flash.now[:alert] = subscriber.errors.full_messages.join(", ")
          render "subscribers/create", status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    subscriber.destroy
  end

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
