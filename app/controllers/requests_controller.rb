class RequestsController < ApplicationController

  before_filter :must_be_school, :only => [:new, :edit, :create, :update, :destroy, :close]
  before_filter :load_school_request, :only => [:edit, :update, :destroy, :close]

  def index
    @active_requests = Request.active
  end

  def new
    @request = Request.new
  end

  def edit
  end

  def create
    @request = current_school.requests.build(params[:request])

    if @request.save
      redirect_to current_school, notice: I18n.t("flashes.requests.created")
    else
      render :action => "new"
    end
  end

  def update
    if @request.update_attributes(params[:request])
      redirect_to current_school, notice: I18n.t("flashes.requests.updated")
    else
      render :action => "edit"
    end
  end

  def destroy
    @request.destroy

    redirect_to current_school, notice: I18n.t("flashes.requests.deleted")
  end

  def close
    @request.close!(params[:users], params[:note])

    redirect_to current_school
  end

  private

  def load_school_request
    @request = current_school.requests.find(params[:id])
  end

end
