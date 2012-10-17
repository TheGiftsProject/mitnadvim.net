require 'active_support/concern'

module UserSupport

  extend ActiveSupport::Concern

  included do
    if respond_to? :helper_method
      helper_method :current_user, :user_signed_in?
      helper_method :school_signed_in?, :volunteer_signed_in?, :admin_signed_in?
  end

  def current_user
    @loaded_user ||= load_user
  end

  def user_signed_in?
    current_user.present?
  end

  def sign_out
    session[:user] = nil
    @loaded_user = nil
  end

  def sign_in(user)
    session[:user] = user.
  end

  def volunteer_signed_in?
    user_signed_in? and current_user.type == 'VolunteerUser'
  end

  def school_signed_in?
    user_signed_in? and current_user.type == 'SchoolUser'
  end

  def admin_signed_in?
    user_signed_in? and current_user.type == 'AdminUser'
  end

  def must_be_signed_in
    forbidden_page unless user_signed_in?
  end

  def must_be_volunteer
    forbidden_page unless volunteer_signed_in?
  end

  def must_be_school
    forbidden_page unless school_signed_in?
  end

  def must_be_admin
    forbidden_page unless admin_signed_in?
  end

  private

  def load_user
    if session[:user]
      return User.find_by_uid(session[:user])
    end
    nil
  end

end