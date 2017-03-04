class Slider < ApplicationRecord
  has_attached_file :image, styles: { large: "1920x1080>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
