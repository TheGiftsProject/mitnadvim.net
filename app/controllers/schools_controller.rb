class SchoolsController < ApplicationController

  def new
    @school = School.new
    @admin_user = User.new

    respond_to do |format|
      format.html
      format.json { render json: @school }
    end
  end

  def show
    @closed_requests = params[:requests] == "closed"
    @requests = (@closed_requests ? current_school.requests.closed.all : current_school.requests.active.all)

    respond_to do |format|
      format.html
      format.json { render json: @requests }
    end
  end

  def edit
    @school = School.find(params[:id])
    @admin_user = @school.admin
  end

  def create
    @school = School.new(params[:school])

    @admin_user = User.new(params[:admin])
    @admin_user.role = :school
    @admin_user.school = @school

    school_is_valid = @school.save
    admin_is_valid = @admin_user.save

    respond_to do |format|
      if school_is_valid and admin_is_valid

        sign_in(@admin_user)

        format.html { redirect_to requests_path, notice: t("flashes.schools.created") }
        format.json { render json: @school, status: :created, location: @school }
      else
        @errors = @school.errors.full_messages + @admin_user.errors.full_messages
        flash[:error] = @errors
        format.html { render action: "new" }
        format.json { render json: @errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @school = School.find(params[:id])

    @admin_user = User.find(params[:user_id])

    school_is_valid = @school.update_attributes(params[:school])
    admin_is_valid = @admin_user.update_attributes(params[:admin])

    respond_to do |format|
      if school_is_valid and admin_is_valid
        format.html { redirect_to @school, notice: t("flashes.schools.updated") }
        format.json { head :no_content }
      else
        @errors = @school.errors.full_messages + @admin_user.errors.full_messages
        flash[:error] = @errors
        format.html { render action: "edit" }
        format.json { render json: @errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @school = School.find(params[:id])
    @school.destroy

    respond_to do |format|
      format.html { redirect_to schools_url }
      format.json { head :no_content }
    end
  end

end
