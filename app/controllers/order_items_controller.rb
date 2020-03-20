class OrderItemsController < ApplicationController
	before_action :set_customer
	def create
		@order = Order.new
		if @order_item.save
			redirect_to thanks_path
		else
			@products = Product.all
			redirect_to products_path, notice: "ご注文は破棄されました。"
		end
	end

	def index
		@order = Order.find(params[:id])
		@order_items = @order.order_items.all
	end

	def new
		@order_item = OrderItem.new
		@cart_items = @customer.cart_items.all
		@order = Order.new
	end

	private
	def set_customer
		@customer = current_customer
	end
    def order_items_params
      params.permit(order_items: [:name, :price])[:order_items]
    end
end


