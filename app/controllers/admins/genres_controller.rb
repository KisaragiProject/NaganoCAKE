class Admins::GenresController < ApplicationController
	before_action :authenticate_admin!
	def create
		@genre = Genre.new(genre_params)
		if @genre.save #入力されたデータをdbに保存する。
  		   redirect_to admins_genres_path, success: "新しいジャンルが作成されました！"#保存された場合の移動先を指定。
	    else
	      @genres = Genre.all
	      flash[:danger] = 'ジャンルの作成に失敗しました。名前の入力欄は空白になっていませんか？'
	      render :index
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
  		redirect_to admins_genres_path, success: "ジャンルの情報が更新されました！"
  	  else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
        flash[:danger] = "ジャンルの情報は更新されませんでした。名前の入力欄は空白になっていませんか？"
  	    render :edit
  	  end
    end

	def genre_params
  	params.require(:genre).permit(:name, :validity)
    end
end

