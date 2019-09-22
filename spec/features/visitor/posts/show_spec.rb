require "rails_helper"

feature "Show Post", :js do
  let(:user) { create :user, full_name: "John Smith" }
  let(:post) { create :post, :published, user: user, title: "Clash Royale cheats", tag_list: %w[clash_royale games] }
  let(:tags_container) { find(".post__tags") }
  let(:tags) { tags_container.text.split }

  before do
    create :post, :published, title: "Marvel films", tag_list: %w[marvel]
    create :post, :published, title: "FIFA", tag_list: %w[footbal games]
  end

  scenario "User sees post" do
    visit post_path(post)

    expect(page).to have_content("Clash Royale cheats")
    expect(page).to have_content("John Smith")
    expect(tags).to match_array(%w[#clash_royale #games])
  end

  scenario "User sees posts with the same tag" do
    visit post_path(post)

    click_on "#games"

    expect(page).to have_content("Clash Royale cheats")
    expect(page).to have_content("FIFA")
    expect(page).not_to have_content("Marvel films")
  end
end
