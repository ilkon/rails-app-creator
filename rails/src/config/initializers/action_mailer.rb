# frozen_string_literal: true

if defined?(ActionMailer)
  Rails.application.config.action_mailer.perform_deliveries = true
  Rails.application.config.action_mailer.raise_delivery_errors = true
  Rails.application.config.action_mailer.perform_caching = false

  if Rails.env.development?
    Rails.application.config.action_mailer.default_options = { from: 'no-reply@localhost' }
    Rails.application.config.action_mailer.delivery_method = :smtp
    Rails.application.config.action_mailer.smtp_settings = { address: '127.0.0.1', port: 1025 }
    Rails.application.config.action_mailer.default_url_options = {
      host:     ENV.fetch('APP_HOST', 'localhost'),
      protocol: 'http',
      port:     ENV.fetch('PORT', 3000)
    }

  elsif Rails.env.test?
    Rails.application.config.action_mailer.delivery_method = :test
    Rails.application.config.action_mailer.default_options = { from: 'no-reply@localhost' }
    Rails.application.config.action_mailer.default_url_options = {
      host:     ENV.fetch('APP_HOST', 'localhost'),
      protocol: 'http',
      port:     ENV.fetch('PORT', 3000)
    }

  else
    Rails.application.config.action_mailer.default_options = { from: ENV.fetch('SENDGRID_EMAIL_FROM', nil) }
    Rails.application.config.action_mailer.delivery_method = :smtp
    Rails.application.config.action_mailer.smtp_settings = {
      user_name:            'apikey',
      password:             ENV.fetch('SENDGRID_API_KEY', nil),
      domain:               ENV.fetch('MAILER_DOMAIN', nil),
      address:              'smtp.sendgrid.net',
      port:                 587,
      authentication:       :plain,
      enable_starttls_auto: true
    }
    Rails.application.config.action_mailer.default_url_options = {
      host:     ENV.fetch('APP_HOST', 'localhost'),
      protocol: 'https',
      port:     443
    }
  end
end
