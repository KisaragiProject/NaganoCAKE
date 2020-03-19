class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items
  has_many :orders

  validates :email, presence: true,
    length: {minimum: 3, maximum: 80}
  validates :password, presence: true,
    length: {minimum: 3, maximum: 20}
end
