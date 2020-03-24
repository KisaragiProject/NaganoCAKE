class AddressesController < ApplicationController
	before_action :authenticate_customer! #ログインユーザーのみ
	before_action :set_customer #現在のカスタマー情報を最初にセット


	def index
		@address = Address.new
		@addresses = @customer.addresses.all
	end

	def edit
		@address = Address.find(params[:id])
		if current_customer.id != @address.customer_id
			redirect_to addresses_path
			flash[:alert] = "アクセスが出来ません"
		end
	end

	def create
		@address = Address.new(address_params)
		@address.customer_id = current_customer.id
		if
			@address.save
			flash[:notice] = "登録に成功しました"
			redirect_to addresses_path
		else
			@customer = current_customer
			@addresses = @customer.addresses.all
			flash[:alert] = "入力内容に誤りがあります"
			render :index
		end
	end

	def update
		@address = Address.find(params[:id])
		if @address.update(address_params)
			flash[:notice] = "更新に成功しました"
			redirect_to addresses_path
		else
			flash[:alert] = "入力内容を確認してください"
			render :edit
		end
	end

	def destroy
		@address = Address.find(params[:id])
		@address.destroy
		redirect_to addresses_path
	end

	private
	  def address_params
	  	params.require(:address).permit(:post_code, :address, :addressee)
	  end

	  def set_customer
	  	@customer = current_customer
	  end
end
