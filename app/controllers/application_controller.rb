require 'controller_support/user_support'

class ApplicationController < ActionController::Base

  protect_from_forgery

  def homepage
    @active_requests = Request.active
  end

  include UserSupport

  def widgets
    #flash.now[:notice] = "HEY"
    #flash.now[:error] = "HEY"
  end
end
