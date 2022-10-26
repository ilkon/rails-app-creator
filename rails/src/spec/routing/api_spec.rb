# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api' do
  it { expect(get: '/hc').to  route_to('healthcheck#index') }
  it { expect(get: '/').to    route_to('healthcheck#index') }
end
