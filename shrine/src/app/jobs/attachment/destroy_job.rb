# frozen_string_literal: true

module Attachment
  class DestroyJob < ApplicationJob
    queue_as :default
    sidekiq_options retry: 5

    def perform(data)
      attacher = Shrine::Attacher.from_data(data)
      attacher.destroy
    end
  end
end
