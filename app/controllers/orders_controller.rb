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
		@order.customer_id = current_customer
		@order.save
		render :confirm
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
		@order = Order.find(params[:id])
		@cart_items = current_customer.cart_items.all
	end

	def thanks
	end
end
