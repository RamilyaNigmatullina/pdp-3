require "rails_helper"

feature "List Posts" do
  before do
    create :post, :published, title: "Clash Royale cheats"
    create :post, :published, title: "Tekken 7 review"
  end

  scenario "User see list of posts" do
    visit posts_path

    expect(page).to have_content("Clash Royale cheats")
    expect(page).to have_content("Tekken 7 review")
  end
end
