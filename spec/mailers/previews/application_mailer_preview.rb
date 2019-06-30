class ApplicationMailerPreview < ActionMailer::Preview
  def post_published
    post = FactoryBot.build_stubbed(:post)

    ApplicationMailer.post_published(post)
  end

  def post_rejected
    post = FactoryBot.build_stubbed(:post)

    ApplicationMailer.post_rejected(post)
  end
end
