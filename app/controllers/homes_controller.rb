class HomesController < ApplicationController
	def top
		@genres = Genre.all #genresバー表示用
		# @products = Product.where(params[genre_id])
		@products = Product.first(4)
		if params[:genre_id].present?
 		 @products = @products.get_by_genre_id params[:genre_id]
		end
	end

	def about
	end

	private

   		def product_params
   			params.require(:product).permit(:name,:price,:image_id)
   		end

   		def genre_params
   			params.require(:genre).permit(:name,:id)
   		end

end
