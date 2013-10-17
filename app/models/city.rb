class City < ActiveRecord::Base
  	attr_accessible :name, :state
  	acts_as_gmappable
  	def gmaps4rails_address
  		"#{name}, #{state}"
	end
end
