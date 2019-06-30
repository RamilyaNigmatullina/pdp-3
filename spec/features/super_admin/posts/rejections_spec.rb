require "rails_helper"

feature "Reject Post" do
  include_context "when super admin signed in"

  before { create :post, title: "Toy Story 4" }

  scenario "Super admin rejects post" do
    visit admin_pending_posts_path

    click_on "Toy Story 4"
    click_on "Reject"

    expect(page).to have_content("Post was successfully rejected.")

    within ".post" do
      expect(page).not_to have_link("Reject")
    end

    click_on "Rejected Posts"

    expect(page).to have_content("Toy Story 4")
  end
end
