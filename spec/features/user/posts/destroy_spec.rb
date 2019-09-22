require "rails_helper"

feature "Destoy Post" do
  include_context :when_user_signed_in

  let(:post) { create :post, user: current_user }

  scenario "User destroys post" do
    visit post_path(post)

    click_on "Delete"

    expect(page).to have_content("Post was successfully destroyed.")
  end
end
