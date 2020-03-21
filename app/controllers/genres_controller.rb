class GenresController < ApplicationController
	def index
		@genres = Genre.all
	end

	def genre_params
  	params.require(:genre).permit(:name,:id)
  end
end

