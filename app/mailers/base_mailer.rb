class BaseMailer < ActionMailer::Base
  layout 'mail'
  default from: 'no-reply@mitnadvim.net'

  def mail(options)
    @css = load_mail_css
    headers['X-MC-InlineCSS'] = 'true' # must be string

    super options
  end

  private

  def load_mail_css
    Rails.application.assets.find_asset('mail/mail').to_s
  end

end