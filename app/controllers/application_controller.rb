require 'controller_support/user_support'

class ApplicationController < ActionController::Base

  protect_from_forgery

  include UserSupport

  def temp_root
    #flash.now[:notice] = "HEY"
    #flash.now[:error] = "HEY"
  end

end
