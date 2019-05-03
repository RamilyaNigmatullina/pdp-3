class PostDecorator < ApplicationDecorator
  delegate :title, :body
end
