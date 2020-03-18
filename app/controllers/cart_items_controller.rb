class CartItemsController < ApplicationController
 # before_action :set_default_values
  # Use this if you wanna set default values only when creating a new record.
  #after_initialize :set_default_values, if: :new_record?

  	def products
  		@products = Product.find(:all)

  	def add_to_cart
  		p = Product.find(params[:id])

	def create
		 @cart_item ||= CartItem.new
		 @cart_item.customer_id = current_customer.id
		 @cart_item.product_id = 1
		 if @cart_item.save #入力された個数をDBに格納する
		 redirect_to cart_items_path

	end
end
	def edit
		@cart_item = CartItem.find(params[:id])
	end

	def destory #現在ユーザーに紐づいているカートアイテムを全部消去するメソッドにしたい
		@current_customer_cart_item = current_customer.cart_item
  		@current_customer_cart_item.destoy
  		redirect_to products_path, notice: "カートを空にしました"
	end

	def index
		@cart_item = CartItem.new
		@cart_item.quanitity = 1
		@cart_items = Product.all

	end

	def show
#		@customer = Customer.find(params[:id])
		@cart_item = CartItem.find(params[:cart_item_id])
		@cart_items = Product.all
#		@cart_items = current_customer.cart_items
	end

	def update
		@cart_item = CartItem.find(params[:id])
		if @cart_item.update
		redirect_to cart_items_path
	 end
	end

	def delete_item
		@cart_item.destory
		redirect_to current_cart
	end


	  private

		 def cart_item_params
  			params.require(:cart_item).permit(:quanitity)
   		end

   # def set_default_values #デフォルトの個数を０に設定
     # self.quanitity   ||= 0
   # end

end
