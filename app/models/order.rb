class Order < ApplicationRecord
	has_many :order_items, , allow_destroy: true

	  #オーダーアイテムを複数追加するためのメソッド
	accepts_nested_attributes_for :order_items

	validates :addressee, presence: true,
	  length: {maximum: 2, minimum: 35}
	validates :post_code, presence: true,
	  length: {maximum: 3, minimum: 10}
	validates :send_to_address, presence: true,
	  length: {maximum: 3, minimum: 50}

end
