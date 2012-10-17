require 'active_support/concern'

module UserSupport

  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :user_signed_in?, :sign_in
    helper_method :must_be_volunteer, :must_be_school, :must_be_admin
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def user_signed_in?
    current_user.present?
  end

  def must_be_volunteer
    unless user_signed_in? && current_user.volunteer?
      forbidden_page
    end
  end

  def must_be_school
    unless user_signed_in? && current_user.school?
      forbidden_page
    end
  end

  def must_be_admin
    unless user_signed_in? && current_user.admin?
      forbidden_page
    end
  end
end

