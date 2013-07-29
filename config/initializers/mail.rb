MitnadvimNet::Application.configure do
  # ignore for test environments
  return if Rails.env.test?

  # Mailer configuration
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      address: 'smtp.gmail.com',
      port: 587,
      domain: 'mitnadvim.net',
      user_name: ENV['SMTP_USERNAME'],
      password: ENV['SMTP_PASSWORD'],
      authentication: 'plain',
      enable_starttls_auto: true
  }
end