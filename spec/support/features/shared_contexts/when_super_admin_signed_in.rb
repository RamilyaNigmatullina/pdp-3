shared_context "when super admin signed in" do
  let(:current_user) { create :super_admin }

  before do
    login_as current_user
  end
end
