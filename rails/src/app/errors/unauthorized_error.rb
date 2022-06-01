# frozen_string_literal: true

class UnauthorizedError < ApiError
  def initialize(message = nil)
    super :unauthorized, message
  end
end
