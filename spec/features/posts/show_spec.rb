require "rails_helper"

feature "Show Post" do
  let(:user) { create :user, full_name: "John Smith" }
  let(:post) { create :post, user: user, title: "Clash Royale cheats", tag_list: %w[clash_royale games] }
  let(:tags_container) { find(".post__tags") }
  let(:tags) { tags_container.text.split }

  scenario "User sees post" do
    visit post_path(post)

    expect(page).to have_content("Clash Royale cheats")
    expect(page).to have_content("John Smith")
    expect(tags).to match_array(%w[#clash_royale #games])
  end
end
