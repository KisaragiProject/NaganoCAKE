class OrdersController < ApplicationController
	before_action :authenticate_customer!
	before_action :set_customer

	def index
		@orders = @customer.orders
	end

	def create
		@order = Order.new(order_params)
		@order.customer_id = current_customer.id
		# 選択した住所によって格納するデータを仕分けする処理
		@add = params[:order][:add]
		if @add.to_i == 1 then
			@order.post_code = @customer.post_code
			@order.send_to_address = @customer.address
			@order.addressee = @customer.family_name + @customer.first_name
		elsif @add == 2 then
			@order.post_code = params[:order][:post_code]
			@order.send_to_address = params[:order][:send_to_address]
			@order.addressee = params[:order][:addressee]
		elsif @add == 3 then
			@order.post_code = params[:order][:post_code]
			@order.send_to_address = params[:order][:send_to_address]
			@order.addressee = params[:order][:addressee]
		end
		@order.save
		if Address.find_by(address: @order.send_to_address).nil?
			@address = Address.new
			@address.post_code = @order.post_code
			@address.address = @order.send_to_address
			@address.addressee = @order.addressee
			@address.customer_id = current_customer.id
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
		# 選択した住所によって格納するデータを仕分けする処理
		@add = params[:order][:add]
		if @add.to_i == 1 then
			@order.post_code = @customer.post_code
			@order.send_to_address = @customer.address
			@order.addressee = @customer.family_name + @customer.first_name
		elsif @add.to_i == 2 then
			@sta = params[:order][:send_to_address].to_i
			@send_to_address = Address.find(@sta)
			@order.post_code = @send_to_address.post_code
			@order.send_to_address = @send_to_address.address
			@order.addressee = @send_to_address.addressee
		elsif @add.to_i == 3 then
			@order.post_code = params[:order][:new_add][:post_code]
			@order.send_to_address = params[:order][:new_add][:address]
			@order.addressee = params[:order][:new_add][:addressee]
		end
	end

	def thanks
	end

	private
	def set_customer
		@customer = current_customer
	end

	def order_params
		params.require(:order).permit(
			:created_at, :send_to_address, :addressee, :order_status, :how_to_pay, :post_code, :deliver_fee,
			order_items_attributes: [:order_id, :product_id, :quantity, :order_price, :make_status]
			)
	end

end
