class RegistrationMailerPreview

  def welcome_user
    RegistrationMailer.welcome_user user
  end

  def welcome_school
    RegistrationMailer.welcome_school school
  end

  private

  def user
    User.last
  end

  def school
    School.last
  end

end
