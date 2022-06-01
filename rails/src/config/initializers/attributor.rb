# frozen_string_literal: true

require 'attributor'

Attributor.configure do |config|
  config.stretches = Rails.env.test? ? 1 : 11
  config.pepper = ENV.fetch('PEPPER', nil)
end
