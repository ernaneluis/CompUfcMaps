class PagesController < ApplicationController
  def index
  	@json = Place.all.to_gmaps4rails do |place, marker|
      # marker.infowindow render_to_string(:partial => "/views/layouts/_test.html.erb", :locals => { :object => user})
                if place.objectives.first.objectiveType == "Estudo"
                    marker.picture({
                        "picture" => 'assets/pin_2.png',
                        "width" =>  '32',
                        "height" => '32'
                     })
                else
                  marker.picture({
                        "picture" => 'assets/pin_1.png',
                        "width" =>  '32',
                        "height" => '32'
                     })
                end
    end
  end
end
