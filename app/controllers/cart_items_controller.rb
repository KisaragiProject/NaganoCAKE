class CartItemsController < ApplicationController
 # before_action :set_default_values
  # Use this if you wanna set default values only when creating a new record.
  #after_initialize :set_default_values, if: :new_record?

 #  	def add_to_cart
 #  		p = Product.find(product_params[:id])
 #  		@cart_item ||= CartItem.new << p.id
	# 	@cart_item.customer_id = current_customer.id
	# 	@cart_item.price ||= 0
	# 	@cart_item.price += p.price
	# 	flash[:notice] = "#{p.name}をカートに追加しました。"
	# 	redirect_to cart_items_path
	# end
	def create
  		@cart_item = CartItem.new (cart_item_params)
		@cart_item.customer_id = current_customer.id
		@cart_item.save
		flash[:notice] = "カートに追加しました。"
		redirect_to cart_items_path
	end

	def edit
		@cart_item = CartItem.find(cart_item_params[:id])
	end

	def destory #現在ユーザーに紐づいているカートアイテムを全部消去するメソッドにしたい
		sesssion[:cart] = []
		session[:price] = 0
		redirect_to params[:back_to]

	end

	def index
		@cart_items = Product.all

	end

	def show
#		@customer = Customer.find(params[:id])
		@cart_item = CartItem.find(cart_item_params[:id])
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
  			params.require(:cart_item).permit(:quantity,:product_id,:customer_id)
   		end
   		def product_params
   			params.require(:product).permit(:name,:price,:id,)
   		end
end
