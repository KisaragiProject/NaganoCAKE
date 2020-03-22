class GenresController < ApplicationController
	def index
		@genres = Genre.all
	end

	def show
		@genre = Genre.find(params[:id])
		@genres = Genre.all
		@products = @genre.products.all
	end

	def genre_params
  	params.require(:genre).permit(:name,:id)
  end
end

