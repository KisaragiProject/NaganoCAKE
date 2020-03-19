class Order < ApplicationRecord
	has_many :order_item

	validates :addressee, presence: true,
	  length: {maximum: 2, minimum: 35}
	validates :post_code, presence: true,
	  length: {maximum: 3, minimum: 10}
	validates :send_to_address, presence: true,
	  length: {maximum: 3, minimum: 50}

end
