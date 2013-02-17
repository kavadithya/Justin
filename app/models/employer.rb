class Employer < ActiveRecord::Base
  attr_accessible :E_address, :E_city, :E_company, :E_country, :email, :E_first_name, :E_last_name, :E_username, :password, :password_confirmation
  has_secure_password

  before_save { |employer| employer.email = email.downcase }
  before_save :create_remember_token
  
  validates :E_address, presence: true, length: { maximum: 250 }
  validates :E_city, presence: true, length: { maximum: 50 }
  validates :E_company, presence: true, length: { maximum: 50 }
  validates :E_country, presence: true, length: { maximum: 50 }
  validates :E_first_name, presence: true, length: { maximum: 50 }
  validates :E_last_name, presence: true, length: { maximum: 50 }
  validates :E_username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64  
    end

end
