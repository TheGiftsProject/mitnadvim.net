class SchoolsController < ApplicationController

  def index
  end

  def new
    @school = School.new
    @admin_user = User.new
  end

  def show
    @closed_requests = params[:requests] == "closed"
    @requests = (@closed_requests ? current_school.requests.closed : current_school.requests.opened).newest_first
  end

  def edit
    @school = School.find(params[:id])
    @admin_user = @school.admin
  end

  def create
    @school = School.new(params[:school])

    @admin_user = User.new(params[:user])
    @admin_user.role = :school
    @admin_user.school = @school

    school_is_valid = @school.save
    admin_is_valid = @admin_user.save

    if school_is_valid and admin_is_valid
      sign_in(@admin_user)
      RegistrationMailer.welcome_school(@school).deliver # Should be delayed
      redirect_to requests_path, notice: t("flashes.schools.created")
    else
      @errors = @school.errors.full_messages + @admin_user.errors.full_messages
      flash[:error] = @errors
      render :action => "new"
    end

  end

  def update
    @school = School.find(params[:id])
    @admin_user = User.find(params[:user_id])
    school_is_valid = @school.update_attributes(params[:school])
    admin_is_valid = @admin_user.update_attributes(params[:admin])

    if school_is_valid and admin_is_valid
      redirect_to @school, notice: t("flashes.schools.updated")
    else
      @errors = @school.errors.full_messages + @admin_user.errors.full_messages
      flash[:error] = @errors
      render :action => "edit"
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
