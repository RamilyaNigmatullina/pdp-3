class PostDecorator < ApplicationDecorator
  delegate :title, :body

  decorates_association :user
end
