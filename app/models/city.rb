class City < ActiveRecord::Base
	attr_accessible :gmaps, :latitude, :longitude, :name, :state

	acts_as_gmappable
		def gmaps4rails_address
			"#{self.name}, #{self.state}"
		end
end
