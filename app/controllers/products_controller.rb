class ProductsController < ApplicationController
	def show
		@product = Product.find(params[:id])
		@genres = Genre.all #genresバー表示用
		@cart = @product.cart_items.build
	end

	def index
		@products = Product.all
		@genres = Genre.all #genresバー表示用
	end

	def create
		@product = Product.find(params[:id])
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.customer_id = current_customer.id
		@cart_item.product_id = @product_id
		@cart_item.save #入力された個数をDBに格納する
		flash[:notice] = "#{p.name}をカートに追加しました。"
		redirect_to cart_items_path
	end


	private
		def cart_item_params
  			params.require(:cart_item).permit(:quantity)
   		end
   		def product_params
   			params.require(:product).permit(:id,)
   		end

end
