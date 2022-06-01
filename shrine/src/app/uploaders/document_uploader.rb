# frozen_string_literal: true

class DocumentUploader < BaseUploader
  plugin :validation_helpers

  Attacher.validate { validate_max_size 15.megabytes }
end
