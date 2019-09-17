shared_context :when_admin_signed_in do
  let(:current_user) { create :admin }

  before do
    login_as current_user
  end
end
