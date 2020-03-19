class OrderItemsController < ApplicationController
	def create
		@customer = current_customer
		if @order_item.save
			redirect_to thanks_path
		else
			@products = Product.all
			redirect_to products_path, notice: "ご注文は破棄されました。"
		end
	end

	def index
	end

	def show
	end

	def new
		@order_item = OrderItem.new
		@customer = current_customer
		@cart_items = @customer.cart_items.all
		# @order = Order.find(params[:id])
	end
end
