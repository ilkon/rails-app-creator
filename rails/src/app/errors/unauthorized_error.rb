# frozen_string_literal: true

# HTTP Error 401
class UnauthorizedError < ApiError
  def initialize(message)
    super :unauthorized, message
  end
end
