class Refmaterial < ApplicationRecord
  belongs_to :category
  mount_uploader :file, RefmaterialUploader

  validates :file, presence: true
  validates :name, presence: true
end
