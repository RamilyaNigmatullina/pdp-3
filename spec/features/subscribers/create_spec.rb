require "rails_helper"

feature "Create Subscriber", :js do
  scenario "User subscribes to newsletters" do
    visit root_path

    fill_in "Email", with: "user@example.com"

    click_on "Subscribe"

    expect(page).to have_content("You have been successfully subscribed to the newsletter!")
  end
end
