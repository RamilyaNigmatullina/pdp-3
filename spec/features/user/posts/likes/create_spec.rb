require "rails_helper"

feature "Like Post" do
  include_context "when current user signed in"

  let(:post) { create :post }

  scenario "User likes post" do
    visit post_path(post)

    click_on "Like"

    expect(page).to have_content("Dislike")
  end
end
