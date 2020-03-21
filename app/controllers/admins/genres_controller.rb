class Admins::GenresController < ApplicationController
	def create
		@genre = Genre.new(genre_params)
		if @genre.save #入力されたデータをdbに保存する。
  		redirect_to admins_genres_path, notice: "successfully created genre!"#保存された場合の移動先を指定。
	end
end
	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
  	@genre = Genre.find(params[:id])
  	if @genre.update(genre_params)
  		redirect_to admins_genres_path, notice: "successfully edit"
  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
        render "edit", notice: "edit error"
  	end
  end

	def genre_params
  	params.require(:genre).permit(:name,:id)
  end
end

