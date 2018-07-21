class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, uniqueness: true, length: {minimum: 2 , maximum: 20}
  validates :introduction, length: {maximum: 50 }

  

  def email_required?
    false
  end

  def email_changed?
    false
  end

  has_many :books
  attachment :profile_image
end
