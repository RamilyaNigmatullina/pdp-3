require "rails_helper"

feature "Create Post" do
  include_context "when admin signed in"

  scenario "Admin creates post" do
    visit new_admin_post_path

    fill_in "Title", with: "The best footballers ever"
    fill_in "Body", with: "Ronaldinho is the best footbal player."

    click_on "Create Post"

    expect(page).to have_content("Post was successfully created.")
  end
end
