class ProductsController < ApplicationController
	def show
		@product = Product.find(params[:id])
		@genres = Genre.all #genresバー表示用
		@cart = @product.cart_items.build #モデルなのでbuildを使用
	end

	def index
		@genres = Genre.all #genresバー表示用

		#リンクをクリックするとジャンルidを取得
		@genre_id = params[:genre_id]
		# @products = Product.where(params[genre_id])
		#ジャンリウidがある場合、ジャンルidのプロダクトだけを表示
		if params[:genre_id].present?
		    @products = @products.get_by_genre_id params[:genre_id]
	      # @selected_genre = Genre.find(params[:genre_id])
    	  # @producs= Product.from_genre(params[:genre_id]).page(params[:page])
    	else
       	 @products= Product.all.page(params[:page])

		end

	end

	private
		def cart_item_params
  			params.require(:cart_item).permit(:quantity)
   		end
   		def product_params
   			params.require(:product).permit(:name,:price,:image_id, :genre_id)
   		end

   		def genre_params
   			params.require(:genre).permit(:name,:id, :genre_id)
   		end
end
