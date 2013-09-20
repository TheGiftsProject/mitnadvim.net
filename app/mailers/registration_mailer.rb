class RegistrationMailer < ActionMailer::Base
  layout 'mail'
  default from: "noreply@mitnadvim.net"

  def welcome_user(user)
    @user = user
    mail(to: @user.email, subject: I18n.t('email.welcome_user.subject'))
  end

  def welcome_school(school)
    @school = school
    mail(to: @school.admin.email, subject: I18n.t('email.welcome_school.subject'))
  end

  def new_response(response)
    @response
    mail(to: @response.request.school.admin.email, subject: I18n.t('email.new_response.subject'))
  end
end
