class ApplicationMailerPreview < ActionMailer::Preview
  def post_published
    post = FactoryBot.build_stubbed(:post)

    ApplicationMailer.post_published(post)
  end

  def post_rejected
    post = FactoryBot.build_stubbed(:post)

    ApplicationMailer.post_rejected(post)
  end

  def daily_updates
    subscriber_email = FactoryBot.build_stubbed(:subscriber)
    posts = FactoryBot.build_stubbed_list(:post, 2)

    ApplicationMailer.daily_updates(subscriber_email, posts)
  end
end
