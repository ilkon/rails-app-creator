# frozen_string_literal: true

Rails.application.config.asset_host = "#{ENV.fetch('HOST', 'localhost')}#{Rails.env.staging? || Rails.env.production? ? '' : ":#{ENV.fetch('PORT', 3000)}"}"
