require "rails_helper"

describe RecentPostsQuery do
  include_context :time_is_frozen

  subject(:query) { described_class.new }

  let!(:post_1) { create :post }
  let!(:post_2) { create :post, created_at: 1.day.ago }
  let!(:post_3) { create :post, created_at: 2.days.ago }

  describe "#all" do
    subject { query.all }

    it { is_expected.to match_array([post_2]) }
  end
end
