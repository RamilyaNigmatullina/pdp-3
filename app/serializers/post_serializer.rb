class PostSerializer < ApplicationSerializer
  include ActionView::Helpers::TextHelper
  include ActionView::Context

  attributes :title, :body, :tag_list, :likes_count, :humanized_created_at, :published, :truncated_body

  belongs_to :user

  def published
    object.published?
  end

  def truncated_body
    truncate(object.body, length: 750)
  end

  def humanized_created_at
    I18n.l(object.created_at, format: :full_datetime)
  end
end
