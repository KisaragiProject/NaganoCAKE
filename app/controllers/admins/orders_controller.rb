class Admins::OrdersController < ApplicationController
	def index
		@from = params[:from].to_i
		if @from == 1 #header
			@orders = Order.all
		elsif @from == 2 #homes/top
			from  = Time.zone.now.at_beginning_of_day
			to = (from + 1.day)
			@orders = Order.where(created_at: from...to)
		elsif @from == 3 #admins/customers/show
			@customer = Customer.find(params[:id])
			@orders = @customer.orders
		end
	end
		# if　params[:button] = 1
		# 	from  = Time.zone.now.at_beginning_of_day
		# 	to = (from + 1.day)
		# 	@orders = Order.where(created_at: from...to)
		# 	elsif　params[:button] = 2
		# 	@orders = Order.where(customer_id(customer))
		# 	else　#それ以外は全表示
		 			# end


	def show
		@order = Order.find(params[:id])
	end

	def update
	  	@order = Order.find(params[:id])
  	if 	@order.update(order_params)
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
		params.require(:order_item).permit(:make_status, :quantity, :order_id, :order_item_id)
	end

end
