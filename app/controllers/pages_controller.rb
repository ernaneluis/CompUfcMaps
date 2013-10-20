class PagesController < ApplicationController
  def index
  	@json = City.all.to_gmaps4rails
      respond_to do |format|
        format.html # index.html.erb
      end
  end
end
