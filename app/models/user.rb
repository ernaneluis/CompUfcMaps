class User < ActiveRecord::Base
  has_many :objectives
  has_many :places, through: :objectives
  attr_accessible :anoConc, :anoIngr, :matricula, :name, :email, :password, :password_confirmation
  attr_accessor :password

  before_save :encrypt_password

  # has_secure_password
  # validates :name, presence: true
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true,
  #       format: { with: VALID_EMAIL_REGEX },
  #       uniqueness: { case_sensitive: false }
  # validates :password, presence: true, length: { minimum: 4 }
  # validates :password_confirmation, presence: true
  validates_confirmation_of :password
   validates_presence_of :password, :on => :create
   validates_presence_of :email
   validates_uniqueness_of :email

   def self.authenticate(email, password)
     user = find_by_email(email)
     if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
       user
     else
       nil
     end
   end

   def encrypt_password
     if password.present?
       self.password_salt = BCrypt::Engine.generate_salt
       self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
     end
   end
end
