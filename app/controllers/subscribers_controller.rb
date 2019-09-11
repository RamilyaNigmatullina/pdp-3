class SubscribersController < ApplicationController
  expose :subscriber, find: -> { Subscriber.find(decrypted_id) }

  skip_verify_authorized only: %i[show create destroy]

  def show
  end

  def create
    respond_to do |format|
      if subscriber.save
        format.js { flash.now[:notice] = t("flash.subscribers.create.notice") }
      else
        format.js { render json: { error: subscriber.errors.full_messages.join(", ") }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    subscriber.destroy

    respond_with subscriber, location: root_path
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end

  def decrypted_id
    Encryptor.instance.decrypt(params[:id])
  end
end
