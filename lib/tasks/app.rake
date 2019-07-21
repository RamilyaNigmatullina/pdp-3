namespace :app do
  desc "Send daily posts updates"
  task send_daily_updates: :environment do
    posts = RecentPostsQuery.new.all

    return unless posts

    Subscriber.find_each do |subscriber|
      ApplicationMailer.daily_updates(subscriber, posts).deliver_later
    end
  end
end
