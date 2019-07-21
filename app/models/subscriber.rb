class Subscriber < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: Devise.email_regexp }

  def encrypted_id
    Encryptor.instance.encrypt(id)
  end
end
