require "rails_helper"

feature "Destroy Subscriber" do
  let(:subscriber) { create :subscriber, email: "user@example.com" }
  let(:posts) { create_list :post, 2 }

  scenario "User unsubscribes from newsletters" do
    visit subscriber_path(subscriber.encrypted_id)

    click_on "Unsubscribe"

    expect(page).to have_content("You have been successfully unsubscribed.")
  end
end
