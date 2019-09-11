class PostDecorator < ApplicationDecorator
  delegate :title, :body, :tag_list, :likes_count, :published?

  SORT_ORDERS = [%w[Recent recent], %w[Oldest oldest], %w[Popular popular]].freeze

  decorates_association :user

  def humanized_created_at
    l(object.created_at, format: :full_datetime)
  end

  def sort_order_options
    SORT_ORDERS
  end
end
