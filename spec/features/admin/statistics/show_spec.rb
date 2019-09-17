require "rails_helper"

feature "Show Statistics" do
  include_context :when_super_admin_signed_in

  scenario "Admin sees statistics list" do
    visit admin_statistics_path

    expect(page).to have_link("Posts creation statistics")
    expect(page).to have_link("Posts ratio statistics")
  end
end
