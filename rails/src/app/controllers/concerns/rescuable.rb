# frozen_string_literal: true

module Rescuable
  def self.included(base)
    base.class_eval do
      rescue_from ApiError do |e|
        if e.message.present?
          render json: { errors: [I18n.t("errors.#{e.message}")], code: e.message }, status: e.status
        else
          head e.status
        end
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { errors: [e.message], code: :not_found }, status: :not_found
      end
    end
  end
end
