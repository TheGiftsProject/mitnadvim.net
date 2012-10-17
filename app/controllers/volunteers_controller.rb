class VolunteersController < ApplicationController

  # GET /volunteers/1
  # GET /volunteers/1.json
  def show
    @user = User.find(params[:id])
    @closed_requests = @user.requests.closed
    @active_requests   = @user.requests.active

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
    user = User.new params[:user]
    user.role = "volunteer"

    if user.save
      sign_in(user)
      redirect_to root_path, :notice => t("users.new.success_notice")
    else
      @errors = user.errors.full_messages
      flash[:error] = @errors
      redirect_to new_volunteer_path
    end
  end

end
