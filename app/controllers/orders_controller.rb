class OrdersController < ApplicationController
	before_action :authenticate_customer!

	def index
		@customer = current_customer
		@orders = @customer.orders.all
	end

	def create
		@customer = current_customer
		@order = Order.new
		@address = Address.new
		if @order.save
			redirect_to thanks_path
		else
			@products = Product.all
			redirect_to products_path, notice: "ご注文は破棄されました。"
		end
	end

	def show
		@customer = current_customer
		@order = Order.find(params[:id])
	end

	def new
		@customer = current_customer
		order = Order.new
	end

	def confirm
		@customer = current_customer
		@order = Order.find(params[:id])
	end

	def thanks
	end
end
