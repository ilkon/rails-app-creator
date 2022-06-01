# frozen_string_literal: true

class HealthcheckController < ApplicationController
  def index
    head :ok
  end
end
