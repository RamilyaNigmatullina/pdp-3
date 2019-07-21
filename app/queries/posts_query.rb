class PostsQuery
  DEFAULT_MAILING_TIME = 9

  def recent_posts
    Post.where(
      "posts.created_at >= :from_date AND posts.created_at < :to_date",
      from_date: from_date,
      to_date: to_date
    )
  end

  private

  def from_date
    1.day.ago.change(hour: mailing_time)
  end

  def to_date
    Time.zone.now.change(hour: mailing_time)
  end

  def mailing_time
    @mailing_time ||= ENV.fetch("MAILING_TIME", DEFAULT_MAILING_TIME)
  end
end
