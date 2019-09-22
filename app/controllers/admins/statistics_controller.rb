module Admins
  class StatisticsController < BaseController
    expose :posts_creation_statistic, :fetch_posts_creation_statistic
    expose :posts_ratio_statistic, :fetch_posts_ratio_statistic
    expose :filter_posts_form, -> { FilterPostsForm.new(filter_posts_form_params) }

    helper_method :filter_params

    def show
    end

    def posts_creation
    end

    def posts_ratio
    end

    private

    def authorize_resource!
      authorize! :statistic, with: Admins::StatisticPolicy
    end

    def filtered_posts
      FilteredPosts.new(Post.all, filter_posts_form.attributes).all
    end

    def fetch_posts_creation_statistic
      filtered_posts.group_by_day(:created_at).count
    end

    def fetch_posts_ratio_statistic
      filtered_posts.group(:state).count
    end

    def filter_posts_form_params
      params.fetch(:filter_posts_form, {}).permit(:state, :from_date, :until_date)
    end
  end
end
