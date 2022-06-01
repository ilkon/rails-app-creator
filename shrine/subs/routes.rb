case Rails.configuration.upload_server
  when :s3
    get 'files/presign'
  when :local
    post 'files/upload'
  end
