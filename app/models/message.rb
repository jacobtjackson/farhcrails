class Message
  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :email, :content, :state

  validates :name,
    presence: true

  validates :email,
    presence: true

  validates :content,
    presence: true

  validates :state,
    presence: true
end
