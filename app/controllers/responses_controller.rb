class ResponsesController < ApplicationController

  def create
    request = Request.find(params[:request_id])
    response = Response.new(:user => current_user, :note => params[:note])
    response.save!

    request.responses << response
    request.save!
    redirect_to root_url
  end

end
