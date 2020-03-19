class ProductsController < ApplicationController
	def show
		@product = Product.find(params[:id])
		@genres = Genre.all #genresバー表示用
		@cart = @product.cart_items.build #モデルなのでbuildを使用
	end

	def index
		@products = Product.all
		@genres = Genre.all #genresバー表示用
	end

	private
		def cart_item_params
  			params.require(:cart_item).permit(:quantity)
   		end
   		def product_params
   			params.require(:product).permit(:name,:price,:image_id)
   		end

end
