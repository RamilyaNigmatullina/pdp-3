require "rails_helper"

feature "Show Post Creation Statistics", :js do
  include_context "when super admin signed in"
  include_context "when time is frozen"

  scenario "Admin sees post creation statistics" do
    visit admin_statistics_path

    fill_in "From", with: 3.days.ago
    fill_in "Until", with: 1.day.ago
    select "Published", from: "State"

    click_on "Show"

    expect(page).to have_content("Posts created from 02 Sep 2019, 14:00 until 04 Sep 2019, 14:00 with state published.")
  end
end
