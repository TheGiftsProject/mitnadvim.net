class ResponsesController < ApplicationController
  def create
    Request.find(params[:request_id]).responses << Response.new(user: current_user)
    redirect_to root_url
  end
end
