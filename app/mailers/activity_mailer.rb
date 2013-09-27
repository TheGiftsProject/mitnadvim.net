class ActivityMailer < BaseMailer

  def volunteer_responded(response)
    @response = response
    mail(to: @response.request.school.admin.email, subject: I18n.t('email.volunteer_responded.subject'))
  end

end