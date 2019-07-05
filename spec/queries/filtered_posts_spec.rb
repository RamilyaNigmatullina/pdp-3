require "rails_helper"

describe FilteredPosts do
  subject(:query) { described_class.new(Post.all, filter_params) }

  let!(:post_1) { create :post, tag_list: %w[games tekken] }
  let!(:post_2) { create :post, tag_list: %w[football] }

  describe "#all" do
    subject(:all) { query.all }

    let(:filter_params) { {} }

    it { is_expected.to match_array([post_1, post_2]) }

    context "when filtered by tags" do
      let(:filter_params) { { tags: %w[games] } }

      it { is_expected.to match_array([post_1]) }
    end
  end
end
