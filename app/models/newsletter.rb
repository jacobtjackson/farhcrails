class Newsletter < ApplicationRecord
  mount_uploader :newsletter, NewsletterUploader
  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
