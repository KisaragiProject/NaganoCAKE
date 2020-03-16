class CustomersController < ApplicationController
	before_action :authenticate_user!
	before_action :baria_user

	def show
		@customer = current_user

	end

	def edit
		@customer = current_user
	end

	def update
		@customer = current_user
		if @customer.update(customer_params)  #更新出来たらマイページ、だめなら編集画面を再表示
			redirect_to customer_path(@customer), notice: 'successfully updated!'
		else
			render :edit
		end

	end

	def withdraw
		@customer = current_user
		@customer.is_active = false
		@customer.update
		redirect_to customer_top_path  #商品一覧viewに戻る(現段階ではRouteErrorになります)
	end

	private
	def customer_params
		params.require(:customer).permit(:is_active, :first_name, :first_name_kana, :family_name, :family_name_kana, :post_code, :address, :email, :password)
	end

	def baria_user
		unless params[:id].to_i == current_user.id
			redirect_to customer_top_path  #商品一覧viewに戻る
		end
	end
end
