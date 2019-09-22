require "rails_helper"

feature "Rejected Post" do
  include_context :when_admin_signed_in

  before do
    create :post, :rejected, title: "The best footballers ever"
    create :post, :published, title: "Toy Story 4"
  end

  scenario "Admin sees rejected posts" do
    visit admins_rejected_posts_path

    expect(page).to have_content("The best footballers ever")
    expect(page).not_to have_content("Toy Story 4")
  end
end
