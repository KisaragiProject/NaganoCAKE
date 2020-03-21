class Admins::CustomersController < ApplicationController
	def index
		@customers = Customer.all
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])

	end

	def update
		@customer = Customer.find(params[:id])
		if
		  @customer.update(customer_params)
		  flash[:success] = "更新に成功しました"
		  redirect_to admins_customer_path
		else
		  flash[:warning] = "入力内容を確認してください"
		  render :edit
		end
	end

	private
	  def customer_params
	  	params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :tel, :email, :is_active)
	  end
end
