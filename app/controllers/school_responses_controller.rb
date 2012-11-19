class SchoolResponsesController < ApplicationController

  before_filter :must_be_school, only: [:create]

  def create
    request = Request.find(params[:request_id])
    request.create_school_response(note: params[:note])
    request.closed = true
    request.save!

    redirect_to school_path(current_school), notice: I18n.t("flashes.requests.closed")
  end

end