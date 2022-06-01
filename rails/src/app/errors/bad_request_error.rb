# frozen_string_literal: true

class BadRequestError < ApiError
  def initialize(message = nil)
    super :bad_request, message
  end
end
