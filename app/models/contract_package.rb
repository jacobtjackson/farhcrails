class ContractPackage < ApplicationRecord
  mount_uploader :file, ContractPackageUploader
  validates :file, presence: true
end
