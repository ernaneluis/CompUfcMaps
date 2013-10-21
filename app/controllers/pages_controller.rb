class PagesController < ApplicationController
  def index
  	@json = User.all.to_gmaps4rails do |user, marker|
        if user.name == "john"
            marker.picture({
                "picture" => 'assets/pin_1.png',
                "width" =>  '32',
                "height" => '32'
             })
        end
    end
  end
end
