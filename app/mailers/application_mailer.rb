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

  def daily_updates
  end
end
