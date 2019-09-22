require "rails_helper"

feature "Pending Post" do
  include_context :when_admin_signed_in

  before do
    create :post, title: "The best footballers ever"
    create :post, :published, title: "Toy Story 4"
  end

  scenario "Admin sees pending posts" do
    visit admins_pending_posts_path

    expect(page).to have_content("The best footballers ever")
    expect(page).not_to have_content("Toy Story 4")
  end
end
