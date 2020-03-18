class Order < ApplicationRecord
	has_many :order_item

	validate :addressee, presence: true,
	  length: {maximum: 2, minimum: 35}
	validate :post_code, presence: true,
	  length: {maximum: 3, minimum: 10}
	validate :send_to_address, presence: true,
	  length: {maximum: 3, minimum: 50}
end
