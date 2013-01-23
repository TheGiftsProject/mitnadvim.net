class ResponsesController < ApplicationController

  def create
    request = Request.find(params[:request_id])
    request.responses.create(user: current_user, note: params[:note])

    redirect_to root_url(:after_response => true)
  end

end
