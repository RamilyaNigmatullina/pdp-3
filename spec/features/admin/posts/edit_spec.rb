require "rails_helper"

feature "Edit Post" do
  include_context "when admin signed in"

  let(:post) do
    create :post, user: current_user, title: "The best footballers ever", body: "Ronaldinho is the best footbal player."
  end

  scenario "Admin edits post" do
    visit edit_admin_post_path(post)

    fill_in "Title", with: "The best football player"
    fill_in "Body", with: "Ronaldo"

    click_on "Update Post"

    expect(page).to have_content("Post was successfully updated.")
  end
end
