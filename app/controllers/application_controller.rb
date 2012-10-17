class ApplicationController < ActionController::Base

  protect_from_forgery
  def temp_root
    #flash.now[:notice] = "HEY"
    #flash.now[:error] = "HEY"
  end

  def root
    @open_requests = Request.where(:status => 'open')
  end
  helper_method :current_user

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
