class Address < ApplicationRecord
	belongs_to :customer

	validates :post_code, presence: true,
      length: {minimum: 2, maximum: 10}
    validates :addressee, presence: true,
      length: {minimum: 2, maximum: 35}
    validates :address, presence: true,
      length: {minimum: 2, maximum: 50}

      # orders/newで登録済住所を表示するメソッド
    def select_address
		self.post_code.to_s + " " + self.address + " " + self.addressee
	end

end
