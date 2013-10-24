class ActivityMailer < BaseMailer

  def volunteer_responded(response)
    @response = response
    @link = school_url(@response.request.school, :host => ENV['APP_HOST'])
    mail(to: @response.request.school.admin.email, subject: I18n.t('email.volunteer_responded.subject'))
  end

  def activity_completed(response)
    @response = response
    @link = user_url(@response.user, :host => ENV['APP_HOST'])
    mail(to: @response.user.email, subject: I18n.t('email.activity_completed.subject'))
  end

end