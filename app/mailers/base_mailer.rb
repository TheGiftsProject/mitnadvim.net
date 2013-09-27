class BaseMailer < ActionMailer::Base
  layout 'mail'
  default from: 'no-reply@mitnadvim.net'

  def mail(options)
    headers['X-MC-InlineCSS'] = 'true' # must be string

    super options
  end

end