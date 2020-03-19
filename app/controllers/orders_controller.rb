class OrdersController < ApplicationController
	before_action :authenticate_customer!

	def index
		@customer = current_customer
		@orders = @customer.orders.all
		@order_items = OrderItem.all

	end

	def create
		@customer = current_customer
		@order = Order.new
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
		@order = Order.new
	end

	def confirm
		@customer = current_customer
		@order = Order.params[:id]
	end

	def thanks
	end

	private
	def order_params
		params.require(:order).permit(:created_at, :send_to_address, :addressee, :order_status, :how_to_pay, :post_code, :deliver_fee)
	end
end
