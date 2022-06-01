# frozen_string_literal: true

if defined?(ActionCable)
  Rails.application.config.action_cable.allowed_request_origins = [%r{^((ws|http)s?://#{ENV.fetch('HOST', 'localhost')})?}, nil]
  Rails.application.config.action_cable.mount_path = '/cable'
end
