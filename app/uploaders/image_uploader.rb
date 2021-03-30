class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  
  # storage :file

  if Rails.env.development? # 開発環境の場合
    storage :file
  elsif Rails.env.test? # テスト環境の場合
    storage :file
  else # 本番環境の場合
    storage :fog
  end
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  process resize_to_fill: [300, 300, 'Center']

  

  
end
