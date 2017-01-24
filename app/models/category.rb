class Category < ApplicationRecord
  has_many :refmaterials
  has_many :refvideos

  validates :name, presence: true
end
