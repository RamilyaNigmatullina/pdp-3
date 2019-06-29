require "rails_helper"

describe Admin::PostPolicy do
  let(:policy) { described_class.new(post, user: user) }
  let(:post) { build_stubbed :post }

  describe "#new" do
    subject { policy.apply(:new?) }

    context "when user is admin" do
      let(:user) { create :admin }

      it { is_expected.to be_truthy }
    end

    context "when user is super admin" do
      let(:user) { create :super_admin }

      it { is_expected.to be_falsey }
    end

    context "when user is user" do
      let(:user) { create :user }

      it { is_expected.to be_falsey }
    end
  end

  describe "#edit" do
    subject { policy.apply(:edit?) }

    context "when user is author of the post" do
      let(:post) { build_stubbed :post, user: user }
      let(:user) { create :admin }

      it { is_expected.to be_truthy }
    end

    context "when user is not admin of the post" do
      let(:user) { create :admin }

      it { is_expected.to be_falsey }
    end
  end
end
