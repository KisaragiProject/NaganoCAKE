class Admins::OrderItemsController < ApplicationController

	def update
	  	@order_item = OrderItem.find(params[:id])
  	if 	@order_item.update(order_item_params)
  		redirect_to admins_order_path(@order), notice: "successfully edit"
  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
        render "show", notice: "update error"
  	end
  end
	def order_item_params
		params.require(:order_item).permit(:make_status, :quantity, :order_id)
	end
end
