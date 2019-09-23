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
    subscriber_id = FactoryBot.create(:subscriber).id
    post_ids = FactoryBot.create_list(:post, 2).map(&:id)

    ApplicationMailer.daily_updates(subscriber_id, post_ids)
  end
end
