# frozen_string_literal: true

# HTTP Error 403
class ForbiddenError < ApiError
  def initialize(message)
    super :forbidden, message
  end
end
