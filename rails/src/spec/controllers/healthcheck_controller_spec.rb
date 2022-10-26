# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthcheckController do
  describe 'GET #index' do
    it 'responds with appropriate HTTP code' do
      get :index

      expect(response).to have_http_status(:ok)
    end
  end
end
