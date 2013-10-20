class User < ActiveRecord::Base
  attr_accessible :anoConc, :anoIngr, :city_id, :gmaps, :latitude, :longitude, :matricula, :name
  belongs_to :city
  acts_as_gmappable
    def gmaps4rails_address
      "#{self.city.name}, #{self.city.state}"
    end
end
