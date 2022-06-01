# frozen_string_literal: true

class BaseUploader < Shrine
  plugin :remove_attachment

  def generate_location(io, record: nil, name: nil, derivative: nil, **)
    if record
      table_name = record.class.table_name
      table = table_name.split('.').last
    else
      table = 'uploads'
    end
    prefix = derivative ? "#{derivative}-" : ''

    "#{table}/#{name}/#{prefix}#{super}"
  end

  private

  def generate_uid(_io)
    SecureRandom.urlsafe_base64(64)
  end
end
