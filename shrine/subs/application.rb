config.upload_server = (Rails.env.production? || Rails.env.staging? ? :s3 : :local)
