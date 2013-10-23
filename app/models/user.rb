class User < ActiveRecord::Base
  has_many :objectives
  has_many :places, through: :objectives
  attr_accessible :anoConc, :anoIngr, :matricula, :name
end
