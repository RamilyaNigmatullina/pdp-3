require "rails_helper"

describe "app:send_daily_updates" do
  include_context :when_time_is_frozen

  let!(:post_1) { create :post, created_at: 5.hours.ago }
  let!(:post_2) { create :post, created_at: 10.hours.ago }
  let!(:post_3) { create :post, created_at: 25.hours.ago }

  let!(:subscriber_1) { create :subscriber }
  let!(:subscriber_2) { create :subscriber }

  let(:action_mail) { instance_double ActionMailer::MessageDelivery, deliver_now: true }

  it "send daily updates" do
    expect(ApplicationMailer).to receive(:daily_updates).with(subscriber_1.id, [post_1.id, post_2.id]) { action_mail }
    expect(ApplicationMailer).to receive(:daily_updates).with(subscriber_2.id, [post_1.id, post_2.id]) { action_mail }
    expect(action_mail).to receive(:deliver_later).twice

    task.invoke
  end
end
