class CombineItemsInCustomer < ActiveRecord::Migration[5.2]
    def up #カートアイテムを一つにまとめるためのメソッド
	Customer.all.each do |customer|
		sums = customer.cart_items.group(:product_id).sum(:quantity)

		sums.each do |product_id, quantity|
			if quantity > 1
				customer.cart_items.where(product_id: good_id).delete_all
				customer.cart_items.create(product_id: good_id, quantity: quantity)
			end
		end
	end
  end
end
