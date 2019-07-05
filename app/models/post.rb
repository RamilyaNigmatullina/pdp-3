class Post < ApplicationRecord
  include AASM

  acts_as_taggable

  belongs_to :user

  validates :title, :body, presence: true

  scope :pending, -> { where(state: :pending) }
  scope :approved, -> { where(state: :approved) }
  scope :rejected, -> { where(state: :rejected) }

  aasm column: :state do
    state :pending, initial: true
    state :published, :cleaning
    state :rejected, :cleaning

    event :publish do
      transitions from: :pending, to: :published
    end

    event :reject do
      transitions from: :pending, to: :rejected
    end
  end
end
