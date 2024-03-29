class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!

	def index
		# どのページからのアクセスかによって処理を変更
		@from = params[:from].to_i
		# ヘッダーから
		if @from == 1
			@orders = Order.order(created_at: :desc).page(params[:page]).per(30)
		# トップページから
		elsif @from == 2
			from  = Time.zone.now.at_beginning_of_day
			to = (from + 1.day)
			@orders = Order.where(created_at: from...to).order(created_at: :desc).page(params[:page]).per(30)
		# 会員ページから
		elsif @from == 3
			@customer = Customer.find(params[:id])
			@orders = @customer.orders.order(created_at: :desc).page(params[:page]).per(30)
		end
	end

	def show
		@order = Order.find(params[:id])
		# 製作ステータスに一つでも２（製作中）があれば、注文ステータスを２（製作中）に変えられるか判定
		@progress1 = can_make(order: @order)
		if @progress1 == true
			@order.order_status = 2
			@order.save
		end
		# 製作ステータスが全て３（製作完了）になったら、注文ステータスを３（発送準備中）に変更
		@progress2 = can_send(order: @order)
		if @progress2 == true && @order.order_status != 4
			@order.order_status = 3
			@order.save
		end

	end

	def update
	  	@order = Order.find(params[:id])
  	if 	@order.update(order_params)
  		# 注文ステータスが１(入金確認)になったら製作ステータスが１(製作待ち)になる
  		if params[:order][:order_status].to_i == 1
  			@order.order_items.each do |oi|
  				oi.make_status = 1
  				oi.save
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

	# 製作ステータスに一つでも２（製作中）があればtrue、なければfalse
	def can_make(order)
		@order.order_items.each do |oi|
		  if oi.make_status == 2
		     return true
		  end
		end
		return false
	end

	# 製作ステータスがすべて３（製作完了）になったらtrue、一つでも違ったらfalse
	def can_send(order)
		@order.order_items.each do |oi|
		  if oi.make_status != 3
		     return false
		  end
		end
		return true
	end

end
