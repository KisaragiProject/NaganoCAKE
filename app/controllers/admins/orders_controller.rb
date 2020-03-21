class Admins::OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
	end

	def update
	  	@order = Order.find(params[:id])
  	if @order.update(order_params)
  		redirect_to admins_order_path(@order), notice: "successfully edit"
  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
        render "show", notice: "update error"
  	end
  end

  	private
	def order_params
		params.require(:order).permit(:created_at, :send_to_address, :addressee, :order_status, :how_to_pay, :post_code, :deliver_fee, :order_status)
	end

	def order_item_params
		params.require(:order_item).permit(:make_status, :quantity, :order_id)
	end

end
