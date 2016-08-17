class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "private/#{model.subdomain}/#{model.class.to_s.underscore}/#{model.id}"
  end

  version(:logo) { process resize_to_fit: [200, 50] }

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
