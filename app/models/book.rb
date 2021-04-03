class Book < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader

    validates :title, presence: true
    validates :body, presence: true
    validate :image_not_upload

    def image_not_upload
        if image.blank?
            errors.add(:image, 'をアップロードしてください')
        end
    end



end
