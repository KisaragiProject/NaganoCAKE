class Admins::ProductsController < ApplicationController
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
		redirect_to admins_products_path
		else
		render :new
		end
	end

	def index
		@products = Product.all
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
  		redirect_to admins_products_path, notice: "successfully edit"
  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
        render "edit", notice: "edit error"
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
