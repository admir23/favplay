class User < ApplicationRecord
  attr_accessor :remember_token

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  validates :password, presence: true, length: { minimum: 6 }
  
  has_secure_password

  has_many :playlists, dependent: :destroy

  has_many :favorites
  has_many :favorited_by, through: :favorites, source: :song

  has_many :albums
  has_many :artists
  has_many :songs
  has_many :genres
  


  ROLE_USER = 0
  ROLE_ADMIN = 1
  ROLE_SUPERADMIN = 2


# Defines if user is admin
  def admin?
    role == ROLE_ADMIN
  end  

# Defines if user is superadmin
  def superadmin?
    role == ROLE_SUPERADMIN
  end


  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
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
end
