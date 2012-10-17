class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:user][:email], params[:user][:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = I18n.t('errors.messages.login_fail')
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => I18n.t('errors.messages.logged_out')
  end
end