class GenresController < ApplicationController
	def create
		@genre = Genre.new(genre_params)
	end
	def index
		@genres = Genre.all
	end

	def genre_params
  	params.require(:genre).permit(:name)
  end
end

