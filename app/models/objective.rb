class Objective < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  attr_accessible :objectiveType, :Instituicao, :periodoIni, :periodoFim, :gmaps, :latitude, :longitude,
  acts_as_gmappable
    def gmaps4rails_address
      "#{self.Instituicao}, #{self.place.city}, #{self.place.state}, #{self.place.country}"
    end
end
