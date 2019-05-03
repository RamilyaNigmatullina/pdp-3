require "rails_helper"

describe Admin::PostPolicy do
  let(:policy) { described_class.new(post, user: user) }
  let(:post) { build_stubbed :post }

  describe "#manage" do
    subject { policy.apply(:manage?) }

    context "when user is admin" do
      let(:user) { create :admin }

      it { is_expected.to be_truthy }
    end

    context "when user is user" do
      let(:user) { create :user }

      it { is_expected.to be_falsey }
    end
  end
end
