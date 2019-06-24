class User < ApplicationRecord
  attr_accessor :remember_token, :validates_password

  before_save :downcase_email
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  FAIXAS = %w(Branca Azul Roxa Marrom Preta).freeze
  
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  has_secure_password
  # we need to make an exception to the password validation if the password is empty for editing: allow_nil: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true, if: :validates_password?
  
  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # Returns a random token.
  def self.new_token
    SecureRandom.urlsafe_base64
  end
    
  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  def self.search(name)
    where("name LIKE ? OR surname LIKE ?", "%#{name}%", "%#{name}%")
  end

  private
    def validates_password?
      self.validates_password
    end

    def downcase_email
      self.email = email.downcase
    end
end
