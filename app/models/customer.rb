class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items
  has_many :products, through: :cart_items
  
  #カートアイテムを複数削除するためのメソッド
  accepts_nested_attributes_for :cart_items, allow_destroy: true

  has_many :orders
  has_many :addresses

  validates :email, presence: true,
    length: {minimum: 3, maximum: 80}

  def full_name
    self.family_name + " " + self.first_name
  end
end
