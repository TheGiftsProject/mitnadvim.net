class RequestsController < ApplicationController

  before_filter :must_be_school, :only => [:new, :edit, :create, :update, :destroy]

  def index
    @active_requests = Request.active
  end

  def new
    @request = Request.new

    respond_to do |format|
      format.html
      format.json { render json: @request }
    end
  end

  def edit
    @request = current_user.school.requests.find(params[:id])
  end

  def create
    @request = current_user.school.requests.build(params[:request])

    respond_to do |format|
      if @request.save
        format.html { redirect_to requests_path, notice: I18n.t("flashes.requests.created") }
        format.json { render json: @request, status: :created, location: @request }
      else
        format.html { render action: "new" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @request = current_user.school.requests.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to requests_path, notice: I18n.t("flashes.requests.updated") }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @request = current_user.school.requests.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url, notice: I18n.t("flashes.requests.deleted") }
    end
  end
end
