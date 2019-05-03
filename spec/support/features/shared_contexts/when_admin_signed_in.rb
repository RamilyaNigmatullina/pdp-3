shared_context "when admin signed in" do
  let(:current_user) { create :admin }

  before do
    login_as current_user
  end
end
