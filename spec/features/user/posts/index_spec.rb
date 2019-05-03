require "rails_helper"

feature "List Posts" do
  before do
    create :post, title: "Clash Royale cheats"
    create :post, title: "Tekken 7 review"
  end

  scenario "User see list of posts" do
    visit posts_path

    expect(page).to have_content("Clash Royale cheats")
    expect(page).to have_content("Tekken 7 review")
  end
end
