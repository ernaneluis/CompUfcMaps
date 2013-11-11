class UsersController < ApplicationController
  # def index
  #   @users = User.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @users }
  #   end
  # end

  # def show
  #   @user = User.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @user }
  #   end
  # end

  def new
    @user = User.new
    # @objective = Objective.new
    # @place =  Place.new

    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @user }
    # end
  end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def create
  #       @place = Place.new(params[:place])
  #           respond_to do |format|
  #               if @place.save
  #                         @user = User.new(params[:user])
  #                                 respond_to do |format|
  #                                         if @user.save
  #                                           @objective = Objective.new(params[:objective])
  #                                           @objective.user_id =  @user.id
  #                                           @objective.place_id = @place.id
  #                                           respond_to do |format|
  #                                                 if @objective.save
  #                                                   format.html { redirect_to @user, notice: 'User was successfully created.' }
  #                                                   format.json { render json: @user, status: :created, location: @user }
  #                                                 else
  #                                                   format.html { render action: "new" }
  #                                                   format.json { render json: @user.errors, status: :unprocessable_entity }
  #                                                 end
  #                                           end
  #                                         else
  #                                           format.html { render action: "new" }
  #                                           format.json { render json: @user.errors, status: :unprocessable_entity }
  #                                         end
  #                                 end
  #                 else
  #                       format.html { render action: "new" }
  #                       format.json { render json: @place.errors, status: :unprocessable_entity }
  #               end
  #       end
  # end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def newPlace
    @user = User.find(session[:user_id])

    if @user
      respond_to do |format|
        format.html {redirect_to new_place_path}
        # format.json { render json: @user }
      end
    end
  end

  def createPlace
@objective = Objective.new
@place =  Place.new
  end

  def savePlace

    @place =  Place.new(params[:place])
    if @place.save
      @user = User.find(session[:user_id])
      @objective = Objective.new(params[:objective])
      @objective.user_id =  @user.id
      @objective.place_id = @place.id
        if @objective.save
          redirect_to root_url, :notice => "New Place"
        end
    end
  end


  # def update
  #   @user = User.find(params[:id])

  #   respond_to do |format|
  #     if @user.update_attributes(params[:user])
  #       format.html { redirect_to @user, notice: 'User was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy

  #   respond_to do |format|
  #     format.html { redirect_to users_url }
  #     format.json { head :no_content }
  #   end
  # end

  # def doLogin
  #   @user = User.new(params[:user])
  # end

end
