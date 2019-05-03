require "rails_helper"

feature "Show Post" do
  let(:post) { create :post, title: "Clash Royale cheats" }

  scenario "User sees post" do
    visit post_path(post)

    expect(page).to have_content("Clash Royale cheats")
  end
end
