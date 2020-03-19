class CartItemsController < ApplicationController

 	def create
  		@cart_item ||= CartItem.new (cart_item_params)
		@cart_item.customer_id = current_customer.id
		@cart_item.save
		flash[:notice] = "カートに追加しました。"
		redirect_to cart_items_path
	end

	def destroy
		@cart_item = CartItem.find(params[:id])
  		@cart_item.destroy
  		redirect_to cart_items_path, notice: "アイテムを削除しました"
	end

	def index
		@customer = current_customer
		@cart_items = @customer.cart_items.all
	end

	def update
		#@cart_item = CartItem.find(params[:id])ではできない？
		if @cart_item.update(cart_item_params)
		redirect_to cart_items_path
	 end
	end

	def destroy_all #カート内アイテム全部消去
		@customer = current_customer
		@customer.cart_items.destroy_all
		redirect_to cart_items_path, notice: "カート空にしました"
	end

	  private
		def cart_item_params
  			params.require(:cart_item).permit(:quantity,:product_id,:customer_id)
   		end
   		def product_params
   			params.require(:product).permit(:name,:price,:id,)
   		end
end
