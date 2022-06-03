# frozen_string_literal: true

require 'sidekiq/web'

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/2') }
end

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/2') }
end

module Sidekiq
  module WebHelpers
    def locale
      'en'
    end
  end
end
