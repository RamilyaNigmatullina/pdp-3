class RecentPostsQuery
  DEFAULT_MAILING_TIME = 9

  attr_reader :relation

  def initialize(relation = Post.all)
    @relation = relation
  end

  def all
    relation.where(
      "posts.created_at BETWEEN :from_date AND :to_date",
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
