# frozen_string_literal: true

# HTTP Error 400
class BadRequestError < ApiError
  def initialize(message)
    super :bad_request, message
  end
end
