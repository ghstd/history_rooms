class User < ApplicationRecord

  attr_accessor :remember_token

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password

  def remember
    self.remember_token = SecureRandom.urlsafe_base64
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    digest = BCrypt::Password.create(self.remember_token, cost: cost)
    update_attribute(:remember_digest, digest)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(token)
  end
end
