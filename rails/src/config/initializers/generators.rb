# frozen_string_literal: true

Rails.application.config.generators do |g|
  ##UUID##
  g.template_engine :slim
  g.test_framework :rspec
  g.factory_bot dir: 'spec/factories'
end
