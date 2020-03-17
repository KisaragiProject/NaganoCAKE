class GenresController < ApplicationController
	def create
		@genre = Genre.new(genre_params)
		if @genre.save #入力されたデータをdbに保存する。
  		redirect_to :index, notice: "successfully created genre!"#保存された場合の移動先を指定。
	end
	def index
		@genres = Genre.all
	end

	def genre_params
  	params.require(:genre).permit(:name)
  end
end

