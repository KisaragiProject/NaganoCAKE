class GenresController < ApplicationController
	def index
		@genres = genres.validity
	end

	def show
		@genre = Genre.find(params[:id])
		@genres = Genre.validity
		@products = @genre.products.page(params[:page])
	end

	def genre_params
  	params.require(:genre).permit(:name,:id)
  end
end

