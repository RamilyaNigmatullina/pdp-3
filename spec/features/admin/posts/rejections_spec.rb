require "rails_helper"

feature "Reject Post" do
  include_context :when_admin_signed_in

  let(:user) { create :user, email: "user@example.com" }

  before { create :post, user: user, title: "Toy Story 4" }

  scenario "Admin rejects post" do
    visit admins_pending_posts_path

    click_on "Toy Story 4"
    click_on "Reject"

    expect(page).to have_content("Post was successfully rejected.")

    within ".post" do
      expect(page).not_to have_link("Reject")
    end

    click_on "Rejected Posts"

    expect(page).to have_content("Toy Story 4")

    open_email("user@example.com")

    expect(current_email.subject).to eq("Post rejected")
    expect(current_email).to have_content("You post Toy Story 4 was rejected")
  end
end
