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

  def inactive
    if (Time.now.to_date - User.last_sign_in_at.to_date).to_i > 30.days
      User.update_attributes(approved: false)
    end
  end
end
