class Refvideo < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :url, presence: true
  validates :body, presence: true
end
