# frozen_string_literal: true

module Attachment
  class PromoteJob < ApplicationJob
    queue_as :default
    sidekiq_options retry: 5

    def perform(record, name, file_data)
      attacher = Shrine::Attacher.retrieve(model: record, name:, file: file_data)
      attacher.create_derivatives if name&.to_sym != :document
      attacher.atomic_promote
    rescue Shrine::AttachmentChanged, ActiveRecord::RecordNotFound
      # attachment has changed or the record has been deleted, nothing to do
    end
  end
end
