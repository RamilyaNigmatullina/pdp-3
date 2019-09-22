require "rails_helper"

describe Admins::StatisticPolicy do
  let(:policy) { described_class.new(:statistic, user: user) }

  describe "#show" do
    subject { policy.apply(:show?) }

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
