class CartItemsController < ApplicationController

	def create
	end

	def destory #全部消去メソッドにする
	end

	def edit
	end

	def index
#		@customer = Customer.find(params[:id])
		@cart_items = current_cart.cart_items
	end

	def update
		if @cart_item.blank?
			@cart_item = current_cart.cart_items.buid(product_id: params[:product_id])
		end
	@cart_item.quanitity += params[:quanitity].to_i
	@cart_item.save
	redirect_to current_cart
	end

	end

	def delete_item　
		@cart_item.destory
		redirect_to current_cart
	end

end
