class Product < ApplicationRecord
	belongs_to :genre
	has_many :cart_items
	has_many :order_items
	attachment :image
	validates :name, presence: true, length: {maximum:30,minimum:2}
	validates :introduction, presence: true, length: {maximum:250,minimum:2}
end
