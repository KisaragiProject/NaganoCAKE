class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!

	def index
		# どのページからのアクセスかによって処理を変更
		@from = params[:from].to_i
		# ヘッダーから
		if @from == 1
			@orders = Order.all
		# トップページから
		elsif @from == 2
			from  = Time.zone.now.at_beginning_of_day
			to = (from + 1.day)
			@orders = Order.where(created_at: from...to)
		# 会員ページから
		elsif @from == 3
			@customer = Customer.find(params[:id])
			@orders = @customer.orders
		end
	end

	def show
		@order = Order.find(params[:id])
	end

	def update
	  	@order = Order.find(params[:id])
  	if 	@order.update(order_params)
  		if params[:order][:order_status].to_i == 1
  			@order.order_items.each do |order_item|
  				order_item.make_status = 1
  				order_item.save
  			end
  		end
  		redirect_to admins_order_path(@order), success: "注文データが更新されました！"
  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
        render "show", notice: "注文データを更新できませんでした。"
  	end
  end

  	private
	def order_params
		params.require(:order).permit(:created_at, :send_to_address, :addressee, :order_status, :how_to_pay, :post_code, :deliver_fee, :order_status)
	end

	def order_item_params
		params.require(:order_item).permit(:make_status, :quantity, :order_id, :order_item_id)
	end

end
