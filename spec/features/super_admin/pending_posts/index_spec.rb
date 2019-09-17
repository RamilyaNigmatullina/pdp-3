require "rails_helper"

feature "Pending Post" do
  include_context :when_super_admin_signed_in

  before do
    create :post, title: "The best footballers ever"
    create :post, :published, title: "Toy Story 4"
  end

  scenario "Super admin sees pending posts" do
    visit admin_pending_posts_path

    expect(page).to have_content("The best footballers ever")
    expect(page).not_to have_content("Toy Story 4")
  end
end
