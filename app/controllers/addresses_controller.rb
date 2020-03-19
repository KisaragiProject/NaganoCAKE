class AddressesController < ApplicationController
	before_action :authenticate_customer! #ログインユーザーのみ


	def index
		@customer = current_customer
		@address = Address.new
		@addresses = Address.all
	end

	def edit
		@address = Address.find(params[:id])
		# if current_customer.id != adress.customer_id
			# redirect_to addresses_path
			# flash[:warning] = "アクセスが出来ません"
		# end
	end

	def create
		@address = Address.new(address_params)
		@address.customer_id = current_customer.id
		if
			@address.save
			flash[:success] = "登録に成功しました"
			redirect_to addresses_path
		else
			@customer = current_customer
			@addresses = @customer.addresses.all
			flash[:warning] = "入力内容に誤りがあります"
			render :index
		end
	end

	def update
		@address = Address.find(params[:id])
		if @address.update(address_params)
			flash[:success] = "更新に成功しました"
			redirect_to addresses_path
		else
			flash[:warning] = "入力内容を確認してください"
			render :edit
		end
	end

	def destroy
		address = Address.find(params[:id])
		address.destroy
		redirect_to addressess_path
	end

	private
	  def address_params
	  	params.require(:address).permit(:post_code, :address, :addressee)
	  end
end
