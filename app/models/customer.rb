class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items
  has_many :products, through: :cart_items

  has_many :orders
  has_many :addresses

  validates :email, presence: true,
    length: {minimum: 3, maximum: 80}

  def full_name
    self.family_name + " " + self.first_name
  end

  def active_for_authentication? #is_activeがtrueの顧客しかログインさせない。
    super && (self.is_active == true)
  end
end
