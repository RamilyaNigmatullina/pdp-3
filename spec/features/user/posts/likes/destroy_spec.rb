require "rails_helper"

feature "Dislike Post" do
  include_context "when current user signed in"

  let(:post) { create :post }

  before { create :like, user: current_user, post: post }

  scenario "User likes post" do
    visit post_path(post)

    click_on "Dislike"

    expect(page).to have_content("Like")
  end
end
