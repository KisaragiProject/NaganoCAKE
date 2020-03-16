class ProductsController < ApplicationController
	def show
		@product = Product.find(params[:id])
		@genres = Genre.all #genresバー表示用
	end

	def index
		@products = Product.all
		@genres = Genre.all #genresバー表示用
	end


end
