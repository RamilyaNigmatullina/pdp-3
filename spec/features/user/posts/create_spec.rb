require "rails_helper"

feature "Create Post", :js do
  include_context :when_user_signed_in

  scenario "User creates post" do
    visit new_users_post_path

    fill_in "Title", with: "The best footballers ever"
    fill_in "Body", with: "Ronaldinho is the best football player."
    fill_in "Tags", with: "football\nfootball player\n"

    click_on "Create Post"

    expect(page).to have_content("Post was successfully created.")
  end
end
