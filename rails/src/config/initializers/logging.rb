# frozen_string_literal: true

if defined?(Rails::Console)
  Rails.application.config.logger = Logger.new('/dev/null')
  Rails.application.config.after_initialize { ActiveRecord::Base.logger.level = 0 }

elsif defined?(Lograge) && !Rails.env.test?
  Rails.application.config.log_level = ENV.fetch('LOG_LEVEL', 'debug').upcase
  Rails.application.config.log_tags = [:remote_ip]

  Rails.application.config.logger = ActiveSupport::TaggedLogging.new(ActiveSupport::Logger.new($stdout, level: Rails.application.config.log_level))

  Rails.application.config.lograge.custom_options = lambda do |event|
    data = event.payload

    addons = {
      env:       Rails.env,
      host:      ENV.fetch('HOST', 'localhost'),
      timestamp: Time.current
    }

    addons[:error] = { type: data[:exception], content: data[:exception_object] } if data[:exception].present?
    addons[:params] = data[:params].except(%w[controller action]) if data[:params].present?

    addons
  end

  Rails.application.config.lograge.ignore_actions = ['HealthcheckController#index']
  Rails.application.config.lograge.formatter = Lograge::Formatters::KeyValue.new
  Rails.application.config.lograge.enabled = true
end
