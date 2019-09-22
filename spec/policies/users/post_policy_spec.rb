require "rails_helper"

describe Users::PostPolicy do
  let(:policy) { described_class.new(post, user: user) }
  let(:post) { build_stubbed :post }

  describe "#create" do
    subject { policy.apply(:create?) }

    context "when user is admin" do
      let(:user) { create :admin }

      it { is_expected.to be_falsey }
    end

    context "when user is user" do
      let(:user) { create :user }

      it { is_expected.to be_truthy }
    end
  end

  describe "#update" do
    subject { policy.apply(:update?) }

    context "when user is author of the post" do
      let(:post) { build_stubbed :post, user: user }
      let(:user) { create :user }

      it { is_expected.to be_truthy }
    end

    context "when user is not author of the post" do
      let(:user) { create :user }

      it { is_expected.to be_falsey }
    end
  end

  describe "#destroy" do
    subject { policy.apply(:destroy?) }

    context "when user is author of the post" do
      let(:post) { build_stubbed :post, user: user }
      let(:user) { create :user }

      it { is_expected.to be_truthy }
    end

    context "when user is not author of the post" do
      let(:user) { create :user }

      it { is_expected.to be_falsey }
    end
  end
end
