class VolunteersController < ApplicationController

  # GET /volunteers/1
  # GET /volunteers/1.json
  def show

    @user = User.find(params[:id])
    #TODO:SAKIN add validation for users that are volunteers

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @areas = Area.all
    @years = *(1940..2000)
    @user = User.new
  end

  def create
    user_params = params[:user]
    user_params.except!(:password, :password_repeat)
    user = User.new user_params
    user.role = "volunteer"
    user.save!

    redirect_to user_path(user)
  end


end
