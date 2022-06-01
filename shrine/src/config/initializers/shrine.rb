# frozen_string_literal: true

require 'shrine'

case Rails.configuration.upload_server
when :s3
  require 'shrine/storage/s3'

  s3_options = {
    access_key_id:     ENV.fetch('SPACES_ACCESS_KEY_ID', nil),
    secret_access_key: ENV.fetch('SPACES_SECRET_ACCESS_KEY', nil),
    region:            ENV.fetch('SPACES_REGION', nil),
    bucket:            ENV.fetch('SPACES_BUCKET', nil),
    endpoint:          ENV.fetch('SPACES_ENDPOINT', nil)
  }

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: 'cache', upload_options: { acl: 'public-read' }, **s3_options),
    store: Shrine::Storage::S3.new(prefix: 'store', upload_options: { acl: 'public-read' }, **s3_options)
  }

  Shrine.plugin :url_options, store: { host: "#{ENV.fetch('SPACES_ENDPOINT', nil)}/#{ENV.fetch('SPACES_BUCKET', nil)}/", public: true }

when :local
  require 'shrine/storage/file_system'

  # both `cache` and `store` storages are needed
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
    store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads')
  }

  Shrine.plugin :url_options, store: { host: 'http://localhost:3000' }
end

Shrine.plugin :activerecord
Shrine.plugin :instrumentation
Shrine.plugin :determine_mime_type, analyzer: :marcel, log_subscriber: nil
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
Shrine.plugin :derivatives

case Rails.configuration.upload_server
when :s3
  Shrine.plugin :presign_endpoint, presign_options: lambda { |request|
    filename = request.params['filename']
    type     = request.params['type']
    {
      content_disposition:  ContentDisposition.inline(filename), # set download filename
      content_type:         type,                                # set content type
      content_length_range: 0..(10 * 1024 * 1024)                # limit upload size to 10 MB
    }
  }
when :local
  Shrine.plugin :upload_endpoint
end

# delay promoting and deleting files to a background job (`backgrounding` plugin)
Shrine.plugin :backgrounding
Shrine::Attacher.promote_block { Attachment::PromoteJob.perform_now(record, name, file_data) }
Shrine::Attacher.destroy_block { Attachment::DestroyJob.perform_now(data) }
