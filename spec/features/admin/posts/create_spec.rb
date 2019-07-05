require "rails_helper"

feature "Create Post", :js do
  include_context "when admin signed in"

  scenario "Admin creates post" do
    visit new_admin_post_path

    fill_in "Title", with: "The best footballers ever"
    fill_in "Body", with: "Ronaldinho is the best football player."
    fill_in "Tags", with: "football\nfootball player\n"

    click_on "Create Post"

    expect(page).to have_content("Post was successfully created.")
  end
end
