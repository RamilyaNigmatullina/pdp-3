class FilterPostsForm
  include ActiveModel::Model

  ATTRIBUTES = %i[from_date until_date state].freeze

  attr_reader(*ATTRIBUTES)

  validates_date :until_date, on_or_after: :from_date, if: :from_date
  validates_date :from_date, :until_date, on_or_before: :today, allow_blank: true

  def attributes
    ATTRIBUTES.each_with_object({}) { |attr, h| h[attr] = send(attr) if send(attr) }
  end

  def from_date=(date)
    @from_date = date.is_a?(String) ? date.to_date : date
  end

  def until_date=(date)
    @until_date = date.is_a?(String) ? date.to_date : date
  end

  def state=(str)
    @state = str.presence
  end
end
