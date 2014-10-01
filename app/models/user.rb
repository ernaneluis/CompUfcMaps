class User < ActiveRecord::Base
  has_many :objectives
  has_many :places, through: :objectives
  attr_accessible :anoConc, :anoIngr, :matricula, :name, :email, :password, :password_confirmation, :universidade, :curso, :cidade
  attr_accessor :password
  before_save :encrypt_password

   validates_confirmation_of :password, :message => "nao esta igual a confirmacao"
   validates_presence_of :password, :on => :create, :message => "nao pode ser vazio"
   validates_presence_of :name, :message => "nao pode ser vazio"
   validates_presence_of :email, :message => "nao pode ser vazio"
   validates_uniqueness_of :email, :message => "ja cadastrado"

   def self.authenticate(email, password)
     user = find_by_email(email)
     #if user && user.password_hash == BCrypt::Engine.hash_secret(password, nil)
     if user && BCrypt::Password.new(user.password_hash) == password
       user
     else
       nil
     end
   end

   def encrypt_password
     if password.present?
       #self.password_salt = BCrypt::Engine.generate_salt
       #self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
       self.password_hash = BCrypt::Password.create(password)
     end
   end

HUMANIZED_ATTRIBUTES = { :password => "Senha",:name => "Nome",:anoConc => "Ano Conclusao",:anoIngr => "Ano Ingresso" }

   def self.human_attribute_name(attr, options={})
      HUMANIZED_ATTRIBUTES[attr.to_sym] || super
   end

end
