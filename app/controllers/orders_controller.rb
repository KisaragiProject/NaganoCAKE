class OrdersController < ApplicationController
	before_action :authenticate_customer!
	before_action :set_customer

	def index
		@orders = @customer.orders
	end

	def create
		@order.customer = current_customer
		@order.save
		if @add = 3
			@address = Address.new
			@address.post_code = @post_code
			@address.address = @address
			@adress.addressee = @addressee
			@address.customer = current_customer
			@address.save
		end
		render :thanks
	end

	def show
		@order = Order.find(params[:id])
	end

	def new
		@order = Order.new
	end

	def confirm
		@order = Order.new
		@cart_items = current_customer.cart_items
		@add = params[:add]
		if @add = 1
			@order.post_code = @customer.post_code
			@order.send_to_address = @customer.address
			@order.addressee = @customer.family_name + @customer.first_name
		elsif @add = 2
			@sta_id = params[:send_to_address]
			@send_to_address = Address.find(params[:sta_id])
			@order.post_code = @send_to_address.post_code
			@order.send_to_address = @send_to_address.address
			@order.addressee = @send_to_address.adressee
		elsif @add = 3
			@post_code = params[:post_code]
			@address = params[:address]
			@addressee = params[:addressee]
			@order.post_code = @post_code
			@order.send_to_address = @address
			@order.addressee = @addressee
		end
	end

	def thanks
	end

	private
	def set_customer
		@customer = current_customer
	end

	def order_params
		params.require(:order).permit(:created_at, :send_to_address, :addressee, :order_status, :how_to_pay, :post_code, :deliver_fee)
	end
end
