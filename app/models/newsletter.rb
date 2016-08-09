class Newsletter < ApplicationRecord
  mount_uploader :newsletter, NewsletterUploader
end
