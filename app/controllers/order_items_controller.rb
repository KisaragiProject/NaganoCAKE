class OrderItemsController < ApplicationController
	before_action :set_customer
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


