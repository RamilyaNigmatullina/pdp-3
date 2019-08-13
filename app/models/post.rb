class Post < ApplicationRecord
  include AASM

  SORT_ORDERS = [%w[Recent recent], %w[Oldest oldest], %w[Popular popular]].freeze

  acts_as_taggable

  belongs_to :user

  has_many :likes, dependent: :destroy

  validates :title, :body, presence: true

  scope :pending, -> { where(state: :pending) }
  scope :approved, -> { where(state: :approved) }
  scope :rejected, -> { where(state: :rejected) }
  scope :recent, -> { order(created_at: :desc) }
  scope :oldest, -> { order(created_at: :asc) }
  scope :popular, -> { order(likes_count: :desc) }

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
