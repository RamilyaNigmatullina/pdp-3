class ApplicationMailer < ActionMailer::Base
  layout "mailer"

  def post_published(post)
    @post = post
    @user = post.user

    mail(to: @user.email)
  end

  def post_rejected(post)
    @post = post
    @user = post.user

    mail(to: @user.email)
  end

  def daily_updates(subscriber_id, post_ids)
    @subscriber = Subscriber.find(subscriber_id)
    @posts = Post.where(id: post_ids)

    mail(to: @subscriber.email)
  end
end
