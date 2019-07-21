require "singleton"

class Encryptor
  include Singleton

  def initialize
    @encryptor = ActiveSupport::MessageEncryptor.new(key)
  end

  def encrypt(value)
    encryptor.encrypt_and_sign(value)
  end

  def decrypt(value)
    encryptor.decrypt_and_verify(value)
  end

  private

  attr_reader :encryptor

  def length
    @length ||= ActiveSupport::MessageEncryptor.key_len
  end

  def key
    ActiveSupport::KeyGenerator.new(secret_key_base).generate_key(salt, length)
  end

  def salt
    ENV.fetch("SALT", "")
  end

  def secret_key_base
    Rails.application.secrets.secret_key_base
  end
end
