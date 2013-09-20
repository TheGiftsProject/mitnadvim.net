class ResponsesController < ApplicationController

  def create
    request = Request.find(params[:request_id])
    @response = request.responses.create(user: current_user, note: params[:note])

    RegistrationMailer.delay.new_response(@response)
    redirect_to root_url(:after_response => true)
  end

end
