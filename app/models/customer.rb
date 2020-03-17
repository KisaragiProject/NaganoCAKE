class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items
  has_many :orders
  validates :first_name, presence: true,
    length: {maximum: 15}
  validates :first_name_kana , presence: true,
    length: {minimum: 2, maximum: 20}
  validates :family_name, presence: true,
    length: {maximum: 2, minimum: 15}
  validates :family_name_kana, presence: true,
    length: {maximum: 2, minimum: 20}
  validates :post_code, presence: true,
    length: {maximum: 3, minimum: 10}
  validates :address, presence: true,
    length: {maximum: 3, minimum: 50}
  validates :tel, presence: true,
    length: {maximum: 3, minimum: 15}
  validates :email, presence: true,
    length: {maximum: 3, minimum: 80}
  validates :password, presence: true,
    length: {maximum: 3, minimum: 20}
end
