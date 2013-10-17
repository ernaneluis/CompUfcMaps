class PagesController < ApplicationController
  def index
  	@json = City.all.to_gmaps4rails 
  end
end
