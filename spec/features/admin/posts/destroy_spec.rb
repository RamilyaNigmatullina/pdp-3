require "rails_helper"

feature "Destoy Post" do
  include_context "when admin signed in"

  let(:post) { create :post }

  scenario "Admin destroys post" do
    visit post_path(post)

    click_on "Delete"

    expect(page).to have_content("Post was successfully destroyed.")
  end
end
