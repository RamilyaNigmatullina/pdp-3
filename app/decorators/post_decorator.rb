class PostDecorator < ApplicationDecorator
  delegate :title, :body, :tag_list

  decorates_association :user

  def humanized_created_at
    l(object.created_at, format: :full_datetime)
  end
end
