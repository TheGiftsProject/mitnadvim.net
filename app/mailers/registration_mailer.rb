class RegistrationMailer < BaseMailer

  def welcome_user(user)
    @user = user
    mail(to: @user.email, subject: I18n.t('email.welcome_user.subject'))
  end

  def welcome_school(school)
    @school = school
    mail(to: @school.admin.email, subject: I18n.t('email.welcome_school.subject'))
  end

end
