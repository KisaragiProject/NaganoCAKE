class OrderItemsController < ApplicationController
	def create
	end

	def index
	end

	def show
		@order = Order.params[:id]
		@customer = current_customer
		@order_items = @cutomer.cart_items.products.all
		@order.items
	end

end
