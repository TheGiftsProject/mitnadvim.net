class ApplicationController < ActionController::Base

  protect_from_forgery


  def temp_root
    #flash.now[:notice] = "HEY"
    #flash.now[:error] = "HEY"
  end

  def root
    @open_requests = Request.where(:status => 'open')
  end
end
