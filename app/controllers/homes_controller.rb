class HomesController < ApplicationController
	def top
		@genres = Genre.all #genresバー表示用
		@products = Product.first(9)
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
