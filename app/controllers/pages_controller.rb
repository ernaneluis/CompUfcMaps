class PagesController < ApplicationController
  def index
  	@json = Objective.all.to_gmaps4rails do |objective, marker|
                 marker.title objective.Instituicao
                 @object = Objective.where(:Instituicao => objective.Instituicao)
                 marker.infowindow  render_to_string(:partial => "infowindow")
                if objective.objectiveType == "Estudo"
                    marker.picture({
                        "picture" => "assets/pin_2.png",
                        "width" =>  32,
                        "height" => 32
                     })
                elsif objective.objectiveType == "Pesquisa"
                    marker.picture({
                        "picture" => "assets/pin_3.png",
                        "width" =>  32,
                        "height" => 32
                     })
                else
                  marker.picture({
                        "picture" => "assets/pin_1.png",
                        "width" =>  32,
                        "height" => 32
                     })
                end

    end
  end
end
