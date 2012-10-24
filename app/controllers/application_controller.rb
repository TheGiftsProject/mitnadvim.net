require 'controller_support/user_support'
require 'controller_support/errors_support'

class ApplicationController < ActionController::Base

  protect_from_forgery

  include UserSupport
  include ErrorsSupport

  def homepage
    @active_requests = Request.active
  end
end
