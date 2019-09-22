require "rails_helper"

feature "Show Post Ratio Statistics", :js do
  include_context :when_admin_signed_in
  include_context :when_time_is_frozen

  before do
    create_list :post, 2, :published, created_at: 3.days.ago
    create :post, :rejected, created_at: 5.days.ago
  end

  scenario "Admin sees post ratio statistics" do
    visit posts_ratio_admins_statistics_path

    fill_in "From", with: 3.days.ago.to_date
    fill_in "Until", with: 1.day.ago.to_date

    click_on "Show"

    expect(page).to have_content("Posts created from 02 Sep 2019 until 04 Sep 2019.")
    expect(page).not_to have_content("No posts")
  end
end
