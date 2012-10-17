class ApplicationController < ActionController::Base

  protect_from_forgery


  def temp_root
    #flash.now[:notice] = "HEY"
    #flash.now[:error] = "HEY"
  end

end
