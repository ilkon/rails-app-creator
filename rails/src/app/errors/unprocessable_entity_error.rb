# frozen_string_literal: true

class UnprocessableEntityError < ApiError
  def initialize(message = nil)
    super :unprocessable_entity, message
  end
end
