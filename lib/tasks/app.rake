namespace :app do
  desc "Send daily posts updates"
  task send_daily_updates: :environment do
    post_ids = RecentPostsQuery.new.all.ids

    return unless posts

    Subscriber.select(:id).each do |subscriber|
      ApplicationMailer.daily_updates(subscriber.id, post_ids).deliver_later
    end
  end
end
