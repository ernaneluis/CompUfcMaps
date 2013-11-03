class User < ActiveRecord::Base

  has_many :objectives
  has_many :places, through: :objectives
  attr_accessible :anoConc, :anoIngr, :matricula, :name, :email, :password, :password_confirmation
  has_secure_password
  before_save { |user| user.email = email.downcase }
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
        format: { with: VALID_EMAIL_REGEX },
        uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true

end
