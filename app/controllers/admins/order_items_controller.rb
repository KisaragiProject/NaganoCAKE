class Admins::OrderItemsController < ApplicationController
  before_action :authenticate_admin!
	def update
      @oi_id = params[:order_item_id].to_i
      @order_item = OrderItem.find(@oi_id)
      @order_item.make_status = params[:make_status].to_i
  	if 	@order_item.save(order_item_params)
        redirect_back(fallback_location: root_path)
        flash[:make_success] = "製作ステータスが更新されました！"

  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
        redirect_back(fallback_location: root_path)
  	end
  end
	def order_item_params
		params.permit(:make_status)
	end
end
