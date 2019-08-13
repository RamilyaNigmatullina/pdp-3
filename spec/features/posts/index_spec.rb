require "rails_helper"

feature "List Posts", :js do
  before do
    create :post, :published, title: "Clash Royale cheats", tag_list: ["games", "clash royale"]
    create :post, :published, title: "Tekken 7 review", tag_list: %w[games tekken]
  end

  scenario "User see list of posts" do
    visit posts_path

    expect(page).to have_content("Clash Royale cheats")
    expect(page).to have_content("Tekken 7 review")
  end

  scenario "Admin searches posts by tags" do
    visit posts_path

    fill_in "Search", with: "clash"

    expect(page).to have_content("Clash Royale cheats")
    expect(page).not_to have_content("Tekken 7 review")
  end
end
