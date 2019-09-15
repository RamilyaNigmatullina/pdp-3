require "rails_helper"

feature "Show Post Ratio Statistics", :js do
  include_context "when super admin signed in"
  include_context "when time is frozen"

  before do
    create_list :post, 2, :published, created_at: 3.days.ago
    create :post, :rejected, created_at: 5.days.ago
  end

  scenario "Admin sees post ratio statistics" do
    visit posts_ratio_admin_statistics_path

    fill_in "From", with: 3.days.ago
    fill_in "Until", with: 1.day.ago

    click_on "Show"

    expect(page).to have_content("Posts created from 02 Sep 2019, 19:00 until 04 Sep 2019, 19:00.")
    expect(page).not_to have_content("No posts")
  end
end
