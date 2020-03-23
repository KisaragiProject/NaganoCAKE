class OrdersController < ApplicationController
	before_action :authenticate_customer!
	before_action :set_customer

	def index
		@orders = @customer.orders
	end

	def create
		@order.customer_id = @customer_id
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
		@add = params[:order][:add]
		if @add.to_i == 1 then
			@order.post_code = @customer.post_code
			@order.send_to_address = @customer.address
			@order.addressee = @customer.family_name + @customer.first_name
			puts"1desu"
		elsif @add.to_i == 2 then
			sta = params[:order][:send_to_address].to_i
			@send_to_address = Address.find(params[:sta])
			@order.post_code = @send_to_address.post_code
			@order.send_to_address = @send_to_address.address
			@order.addressee = @send_to_address.adressee
		elsif @add.to_i == 3 then
			@post_code = params[:order][:new_add][:post_code]
			@address = params[:order][:new_add][:address]
			@addressee = params[:order][:new_add][:addressee]
			binding.pry
			@order.post_code = @post_code
			@order.send_to_address = @address
			@order.addressee = @addressee
			puts "2desu"
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
