require "rails_helper"

feature "Sign Out" do
  include_context :when_current_user_signed_in

  scenario "User signs out" do
    visit "/"
    click_link "Sign out"

    expect(page).to have_content("Sign in")
  end
end
