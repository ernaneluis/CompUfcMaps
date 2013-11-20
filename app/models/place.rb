class Place < ActiveRecord::Base
  has_many :objectives
  has_many :users, through: :objectives
  attr_accessible :city, :country, :state
end
