class ApplicationController < ActionController::Base

  protect_from_forgery
  def widgets
    #flash.now[:notice] = "HEY"
    #flash.now[:error] = "HEY"
  end

  def homepage
    @open_requests = Request.where(:status => 'open')
  end
  helper_method :current_user, :user_signed_in?
  helper_method :must_be_volunteer, :must_be_school, :must_be_admin

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    current_user.present?
  end

  def must_be_volunteer
    user_signed_in? && current_user.volunteer?
  end

  def must_be_school
    user_signed_in? && current_user.school?
  end

  def must_be_admin
    user_signed_in? && current_user.admin?
  end

end
