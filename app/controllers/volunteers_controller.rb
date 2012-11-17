class VolunteersController < ApplicationController

  def show
    @active_responses = current_user.responses.active

    respond_to do |format|
      format.html
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
        format.html { redirect_to root_path, :notice => t("flashes.users.created") }
      else
        @errors = @user.errors.full_messages
        flash[:error] = @errors
        format.html { render :action => "new" }
      end
    end
  end

end
