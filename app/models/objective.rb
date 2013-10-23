class Objective < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  attr_accessible :objectiveType, :Instituicao, :periodoIni, :periodoFim
end
