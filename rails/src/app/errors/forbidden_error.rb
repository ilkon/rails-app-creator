# frozen_string_literal: true

class ForbiddenError < ApiError
  def initialize(message = nil)
    super :forbidden, message
  end
end
