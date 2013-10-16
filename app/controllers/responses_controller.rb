class ResponsesController < ApplicationController

  def create
    request = Request.find(params[:request_id])
    @response = request.responses.create(user: current_user, note: params[:note])

    session[:after_response] = true
    redirect_to root_url
  end

end
