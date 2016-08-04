class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.unapproved
    where(approved: false).order('id DESC')
  end

  def self.approved
    where(approved: true).order('id DESC')
  end
end
