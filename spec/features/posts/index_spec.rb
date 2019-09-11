require "rails_helper"

feature "List Posts", :js do
  let(:first_post) { find(".post:nth-child(1)") }
  let(:second_post) { find(".post:nth-child(2)") }

  before do
    create :post, :published, :with_likes, likes_number: 3,
      title: "Tekken 7 review", tag_list: %w[games tekken]
    create :post, :published, :with_likes, likes_number: 1,
      title: "Clash Royale cheats", tag_list: ["games", "clash royale"]
  end

  scenario "User see list of posts" do
    visit posts_path

    expect(page).to have_content("Clash Royale cheats")
    expect(page).to have_content("Tekken 7 review")
  end

  scenario "User searches posts by tags" do
    visit posts_path

    fill_in "Search", with: "clash"

    expect(page).to have_content("Clash Royale cheats")
    expect(page).not_to have_content("Tekken 7 review")
  end

  scenario "User sorts posts by popular" do
    visit posts_path

    expect(first_post).to have_content("Clash Royale cheats")
    expect(second_post).to have_content("Tekken 7 review")

    select "Popular", from: "Sort by"

    expect(first_post).to have_content("Tekken 7 review")
    expect(second_post).to have_content("Clash Royale cheats")
  end
end
