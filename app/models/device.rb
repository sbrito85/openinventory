class Device < ActiveRecord::Base
  attr_accessible :make, :model, :assettype, :image,:image_file_name

  validates :make, presence: true
  validates :assettype, presence: true
  validates :model, presence: true
  validates_attachment :image,
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }
  has_many :asset
  has_attached_file :image, styles: { small: "96x96>"}
end
