class SchoolResponsesController < ApplicationController

  before_filter :must_be_school, only: [:create]

  def create
    request = Request.find(params[:request_id])

    refined_params = refine_params(params[:school_response])
    request.create_school_response(refined_params)
    request.closed = true
    request.save!

    redirect_to school_path(current_school), notice: I18n.t("flashes.requests.closed")
  end

  def refine_params(params)
    users = params[:users].map {|user_id| User.find(user_id)}
    new_params = {
      :note => params[:note],
      :users => users
    }
  end

end