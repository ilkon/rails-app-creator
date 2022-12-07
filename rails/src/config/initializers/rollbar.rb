# frozen_string_literal: true

if defined?(Rollbar)
  Rollbar.configure do |config|
    config.environment = Rails.env

    config.enabled = (Rails.env.staging? || Rails.env.production?) && ENV.fetch('ROLLBAR_ACCESS_TOKEN').present?
    if config.enabled
      config.access_token = ENV.fetch('ROLLBAR_ACCESS_TOKEN')

      config.send_extra_frame_data = :app
      # config.person_method = 'user'
      # config.person_id_method = "my_id"
      config.person_username_method = 'email'
      # config.person_email_method = "my_email"
      # config.custom_data_method = lambda { {:some_key => "some_value" } }

      if defined?(Sidekiq)
        config.use_sidekiq 'queue' => 'default'
        config.failover_handlers = [Rollbar::Delay::Thread]
      else
        config.async_handler = proc do |payload|
          Thread.new { Rollbar.process_from_async_handler(payload) }
        end
      end
    end

    config.js_enabled = config.enabled && ENV.fetch('ROLLBAR_CLIENT_ACCESS_TOKEN').present?
    if config.js_enabled
      config.js_options = {
        accessToken:                ENV.fetch('ROLLBAR_CLIENT_ACCESS_TOKEN'),
        captureUncaught:            true,
        captureUnhandledRejections: true,
        payload:                    {
          environment: config.environment
        }
      }
    end
  end
end
