class Admins::GenresController < ApplicationController
	def index
		@genres = Genre.all
	end

end
