require "active_support/concern"

module SchoolSupport

  extend ActiveSupport::Concern

  included do
    helper_method :current_school
  end

  def current_school
    current_user.school
  end

  def must_be_school
    unless user_signed_in? && current_user.school?
      forbidden_page
    end
  end

end