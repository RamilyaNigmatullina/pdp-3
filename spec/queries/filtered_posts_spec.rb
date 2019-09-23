require "rails_helper"

describe FilteredPosts do
  subject(:query) { described_class.new(Post.all, filter_params) }

  let!(:post_1) { create :post, :published, created_at: 5.days.ago, tag_list: %w[games tekken] }
  let!(:post_2) { create :post, :rejected, created_at: 1.day.ago, tag_list: %w[football] }

  describe "#all" do
    subject(:all) { query.all }

    let(:filter_params) { {} }

    it { is_expected.to match_array([post_1, post_2]) }

    context "when filtered by tags" do
      let(:filter_params) { { tags: %w[games] } }

      it { is_expected.to match_array([post_1]) }
    end

    context "when filtered by from date" do
      let(:filter_params) { { from_date: 3.days.ago } }

      it { is_expected.to match_array([post_2]) }
    end

    context "when filtered by until date" do
      let(:filter_params) { { until_date: 3.days.ago } }

      it { is_expected.to match_array([post_1]) }
    end

    context "when filtered by state" do
      let(:filter_params) { { state: "rejected" } }

      it { is_expected.to match_array([post_2]) }
    end
  end
end
