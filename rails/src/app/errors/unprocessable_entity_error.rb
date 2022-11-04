# frozen_string_literal: true

# HTTP Error 422
class UnprocessableEntityError < ApiError
  def initialize(message)
    super :unprocessable_entity, message
  end
end
