module Admin
  class StatisticsController < BaseController
    expose :posts_creation_statistic, :fetch_posts_creation_statistic
    expose :posts_ratio_statistic, :fetch_posts_ratio_statistic

    helper_method :filter_params

    def index
    end

    def posts_creation
    end

    def posts_ratio
    end

    private

    def authorize_resource!
      authorize! :statistic, with: Admin::StatisticPolicy
    end

    def filtered_posts
      FilteredPosts.new(Post.all, filter_params).all
    end

    def fetch_posts_creation_statistic
      filtered_posts.group_by_day(:created_at).count
    end

    def fetch_posts_ratio_statistic
      filtered_posts.group(:state).count
    end

    def filter_params
      params.fetch(:filter_posts_form, {})
        .permit(:state, :created_at_from, :created_at_until)
        .reject { |_, v| v.blank? }
        .to_h
    end
  end
end
