class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :full_name, :role, presence: true

  has_many :posts, dependent: :destroy

  enum role: { user: "user", admin: "admin", super_admin: "super_admin" }
end
