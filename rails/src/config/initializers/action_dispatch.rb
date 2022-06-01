# frozen_string_literal: true

if defined?(ActionDispatch)
  Rails.application.config.action_dispatch.default_url_options = {
    host:     ENV.fetch('HOST', 'localhost'),
    protocol: Rails.env.staging? || Rails.env.production? ? 'https' : 'http',
    port:     Rails.env.staging? || Rails.env.production? ? 443 : ENV.fetch('PORT', 3000)
  }
end
