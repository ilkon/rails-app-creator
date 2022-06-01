# frozen_string_literal: true

if defined?(Rack::Cors)
  Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins('*')
      resource '*',
               headers: :any,
               expose:  %w[authorization authorization-refresh],
               methods: %i[get post put patch options delete head]
    end
  end
end
