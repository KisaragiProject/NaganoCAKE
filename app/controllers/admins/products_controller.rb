class Admins::ProductsController < ApplicationController
	before_action :authenticate_admin!
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save(product_params)
		redirect_to admins_products_path, success: '新しい商品データが作成されました！'
		else
		flash[:danger] = '商品データを作成できませんでした。商品写真の選び忘れや空欄はありませんか？'
		render :new
		end
	end

	def index
		@products = Product.order(id: :DESC).page(params[:page]).per(30)
	end

	def show
    	@product = Product.find(params[:id])
    end

	def edit
    	@product = Product.find(params[:id])
    end

    def update
  	@product = Product.find(params[:id])
  	if @product.update(product_params)
  		redirect_to admins_products_path, success: '商品データを更新しました！'
  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
        flash[:danger] = "商品データを更新できませんでした。空欄になっている箇所はありませんか？"
  		render :edit
  	end
  end


	private
	def product_params
		params.require(:product).permit(:name, :genre_id, :image, :introduction, :status, :price)
	end

	def genre_params
		params.require(:genre).permit(:name)
	end
end
