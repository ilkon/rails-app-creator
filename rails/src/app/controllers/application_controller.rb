# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Rescuable
  respond_to :json

  before_action :set_cache_expiration

  private

  def set_cache_expiration
    response.headers['Cache-Control'] = 'no-cache, no-store'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Mon, 01 Jan 1990 00:00:00 GMT'
  end
end
