class PagesController < ApplicationController
  def index
  	@json = User.all.to_gmaps4rails do |user, marker|
      marker.infowindow render_to_string(:partial => "/views/layouts/_test.html.erb", :locals => { :object => user})
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
