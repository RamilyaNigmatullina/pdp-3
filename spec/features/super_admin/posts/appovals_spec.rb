require "rails_helper"

feature "Approve Post" do
  include_context "when super admin signed in"

  before { create :post, title: "Toy Story 4" }

  scenario "Super admin approves post" do
    visit admin_pending_posts_path

    click_on "Toy Story 4"
    click_on "Publish"

    expect(page).to have_content("Post was successfully published.")

    within ".post" do
      expect(page).not_to have_link("Publish")
    end

    click_on "Blog"

    expect(page).to have_content("Toy Story 4")
  end
end
