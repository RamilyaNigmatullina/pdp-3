shared_context :when_super_admin_signed_in do
  let(:current_user) { create :super_admin }

  before do
    login_as current_user
  end
end
