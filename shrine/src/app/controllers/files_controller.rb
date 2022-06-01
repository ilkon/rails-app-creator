# frozen_string_literal: true

class FilesController < ApplicationController
  skip_before_action :authenticate!

  def upload
    setup_rack_response BaseUploader.upload_response(:cache, request.env)
  end

  def presign
    setup_rack_response BaseUploader.presign_response(:cache, request.env)
  end

  private

  def setup_rack_response((status, hdrs, body))
    self.status = status
    headers.merge!(hdrs)
    self.response_body = body
  end
end
