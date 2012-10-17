class SchoolsController < ApplicationController
  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schools }
    end
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
    @school = School.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @school }
    end
  end

  # GET /schools/new
  # GET /schools/new.json
  def new
    @school = School.new
    @admin_user = User.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @school }
    end
  end

  # GET /schools/1/edit
  def edit
    @school = School.find(params[:id])
    @admin_user = @school.admin
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(params[:school])

    @admin_user = User.new(params[:admin])
    @admin_user.role = :school
    @admin_user.school = @school

    school_is_valid = @school.save
    admin_is_valid = @admin_user.save

    respond_to do |format|
      if school_is_valid and admin_is_valid
        format.html { redirect_to requests_path(), notice: t("schools.signup.successfully_created") }
        format.json { render json: @school, status: :created, location: @school }
      else
        @errors = @school.errors.full_messages + @admin_user.errors.full_messages
        flash[:error] = @errors
        format.html { render action: "new" }
        format.json { render json: @errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schools/1
  # PUT /schools/1.json
  def update
    @school = School.find(params[:id])

    @admin_user = User.find(params[:user_id])

    school_is_valid = @school.update_attributes(params[:school])
    admin_is_valid = @admin_user.update_attributes(params[:admin])

    respond_to do |format|
      if school_is_valid and admin_is_valid
        format.html { redirect_to @school, notice: t("schools.signup.successfully_updated") }
        format.json { head :no_content }
      else
        @errors = @school.errors.full_messages + @admin_user.errors.full_messages
        flash[:error] = @errors
        format.html { render action: "edit" }
        format.json { render json: @errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school = School.find(params[:id])
    @school.destroy

    respond_to do |format|
      format.html { redirect_to schools_url }
      format.json { head :no_content }
    end
  end
end
