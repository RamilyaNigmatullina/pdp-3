# require "rails_helper"
#
# feature "Show Post Creation Statistics", :js do
#   include_context :when_super_admin_signed_in
#   include_context :when_time_is_frozen
#
#   before do
#     create_list :post, 2, :published, created_at: 3.days.ago
#     create :post, :rejected, created_at: 5.days.ago
#   end
#
#   scenario "Admin sees post creation statistics" do
#     visit posts_creation_admin_statistics_path
#
#     fill_in "From", with: 6.days.ago
#     fill_in "Until", with: 1.day.ago
#
#     select "Published", from: "State"
#
#     click_on "Show"
#
#     expect(page).to have_content("Posts created from 30 Aug 2019 until 04 Sep 2019 with state published.")
#     expect(page).not_to have_content("No posts")
#   end
# end
