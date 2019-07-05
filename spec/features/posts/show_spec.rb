require "rails_helper"

feature "Show Post" do
  let(:user) { create :user, full_name: "John Smith" }
  let(:post) { create :post, user: user, title: "Clash Royale cheats", tag_list: ["clash royale", "games"] }

  scenario "User sees post" do
    visit post_path(post)

    expect(page).to have_content("Clash Royale cheats")
    expect(page).to have_content("John Smith")
    expect(page).to have_content("#games #clash royale")
  end
end
