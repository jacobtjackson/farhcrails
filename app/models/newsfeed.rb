class Newsfeed < ApplicationRecord
  default_scope { order('updated_at DESC') }
  validates :message, length: { minimum: 5 }, presence: true
  def timestamp
    created_at.strftime('%d %B %Y')
  end
end
