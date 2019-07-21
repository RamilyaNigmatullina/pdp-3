namespace :app do
  desc "Send daily posts updates"
  task send_daily_updates: :environment do
    posts = PostsQuery.new.recent_posts

    return unless posts

    Subscriber.find_each do |subscriber|
      ApplicationMailer.daily_updates(subscriber, posts).deliver_now
    end
  end
end
