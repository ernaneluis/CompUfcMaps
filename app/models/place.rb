class Place < ActiveRecord::Base
  has_many :objectives
  has_many :users, through: :objectives
  attr_accessible :city, :country, :gmaps, :latitude, :longitude, :state
  acts_as_gmappable
    def gmaps4rails_address
      "#{self.city}, #{self.state}, #{self.country}"
    end
end
