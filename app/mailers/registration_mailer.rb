class RegistrationMailer < ActionMailer::Base
  default from: "noreply@mitnadvim.net"

  def welcome_user(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: I18n.t('email.subject.welcome_user')).deliver
  end

  def welcome_school(school_id)
    @school = School.find(school_id)
    mail(to: @school.admin.email, subject: I18n.t('email.subject.welcome_school')).deliver
  end

  def new_response(response_id)
    @response = Response.find(response_id)
    mail(to: @response.request.school.admin.email, subject: I18n.t('email.subject.new_response')).deliver
  end
end
