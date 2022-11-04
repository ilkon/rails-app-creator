# frozen_string_literal: true

# HTTP Error 404
class NotFoundError < ApiError
  def initialize(message)
    super :not_found, message
  end
end
