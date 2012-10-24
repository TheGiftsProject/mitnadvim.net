class VolunteersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @closed_requests = @user.requests.closed
    @active_requests   = @user.requests.active

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    @user.role = "volunteer"

    respond_to do |format|
      if @user.save
        sign_in(@user)
        format.html { redirect_to root_path, :notice => t("users.new.success_notice") }
      else
        @errors = @user.errors.full_messages
        flash[:error] = @errors
        format.html { render :action => "new" }
      end
    end
  end

end
