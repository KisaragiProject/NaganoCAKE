class CartItemsController < ApplicationController
before_action :set_cart_item, only: [:create, :show, :update, :destroy, :edit]
before_action :set_customer
 	def create
 	# 	if @cart_item == nil
  # 	 	@cart_item = CartItem.new (cart_item_params)
		# @cart_item.customer_id = current_customer.id
		# @cart_item.save
		# else
		# @cart_item = CartItem.find(params[:id])
		# @cart_item.update(quantity: params[:quantity].to_i)
		# end
	if	current_item = cart cart_items.find_by_product_id(product_id)
		current_item.quantity += params[:quantity].to_i
		current_item = CartItem.find(params[:product_id])
	else
		current_item = cart_items.build(product_id: product_id)
	end
    	current_item.save
		flash[:success] = "カートに追加しました。"
		redirect_to cart_items_path
	end

	def destroy
  		@cart_item.destroy
  		redirect_to cart_items_path, success: "アイテムを削除しました"
	end

	def index
		@cart_items = @customer.cart_items.all
	end

	def update
		if @cart_item.update(cart_item_params)
		redirect_to cart_items_path
	 end
	end

	def destroy_all #カート内アイテム全部消去
		@customer.cart_items.destroy_all
		redirect_to cart_items_path, success: "カート空にしました"
	end

	  private

	  	def set_customer
	  		@customer = current_customer
	  	end

	  	def set_cart_item
	  		@cart_item = CartItem.find(params[:id])
	  	end

		def cart_item_params
      		params.require(:cart_item).permit(:product_id, :customer_id, :quantity)
    	end

   		def product_params
   			params.require(:product).permit(:name,:price,:id,)
   		end
end
