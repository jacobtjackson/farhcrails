class User < ApplicationRecord
  before_save { self.email = email.downcase if email.present? }
  before_save { self.role ||= :member }
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, unless: :password_digest
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }
  has_secure_password

  def self.unapproved
    where(approved: false).order('id DESC')
  end

  def self.approved
    where(approved: true).order('id DESC')
  end

  enum role: [:member, :admin]
end
