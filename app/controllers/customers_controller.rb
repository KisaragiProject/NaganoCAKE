class CustomersController < ApplicationController
	before_action :authenticate_customer!
	before_action :baria_customer  #本人以外のアクセスを防ぐ

	def show
		@customer = current_customer
	end

	def edit
		@customer = current_customer
	end

	def update
		@customer = current_customer
		if @customer.update(customer_params)  #更新出来たらマイページ、だめなら編集画面を再表示
			redirect_to customer_path(@customer), notice: 'successfully updated!'
		else
			render :edit
		end

	end

	def withdraw
		@customer = current_customer
		@customer.is_active = false
		@customer.update(customer_params)
		redirect_to customer_top_path  #商品一覧viewに戻る(現段階ではRouteErrorになります)
	end

	private
	def customer_params
		params.require(:customer).permit(:is_active, :first_name, :first_name_kana, :family_name, :family_name_kana, :post_code, :address, :email, :password)
	end

	def baria_customer
		unless params[:id].to_i == current_customer.id
			redirect_to customer_top_path  #商品一覧viewに戻る
		end
	end
end
