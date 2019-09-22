require "rails_helper"

describe Admins::PendingPostPolicy do
  let(:policy) { described_class.new(post, user: user) }
  let(:post) { build_stubbed :post }

  describe "#index" do
    subject { policy.apply(:index?) }

    context "when user is admin" do
      let(:user) { create :admin }

      it { is_expected.to be_truthy }
    end

    context "when user is user" do
      let(:user) { create :user }

      it { is_expected.to be_falsey }
    end
  end

  describe "#update" do
    subject { policy.apply(:update?) }

    context "when user is admin" do
      let(:user) { create :admin }

      it { is_expected.to be_truthy }

      context "when post is published" do
        let(:post) { build_stubbed :post, :published }

        it { is_expected.to be_falsey }
      end
    end

    context "when user is user" do
      let(:user) { create :user }

      it { is_expected.to be_falsey }
    end
  end
end
