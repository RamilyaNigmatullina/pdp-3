class PostDecorator < ApplicationDecorator
  delegate :title, :body, :tag_list

  decorates_association :user

  def formatted_created_at
    object.created_at.strftime("%d %b %Y, %k:%M")
  end
end
