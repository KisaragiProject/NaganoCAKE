class Order < ApplicationRecord
	has_many :order_item

	validate :addressee, length: {maximum: 2, minimum: 35}
	validate :post_code, length: {maximum: 3, minimum: 10}
	validate :send_to_address, length: {maximum: 3, minimum: 50}
end
