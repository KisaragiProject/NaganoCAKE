class Admins::CustomersController < ApplicationController
	before_action :authenticate_admin!
	# CSRF対策で追記
	protect_from_forgery

	def index
		@customers = Customer.page(params[:page]).per(30)
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
		  redirect_to admins_customer_path(@customer), success: '更新に成功しました！'
		else
		  flash[:danger] = "入力内容を確認してください"
		  render :edit
		end
	end

	private
	  def customer_params
	  	params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :tel, :email, :address, :is_active)
	  end
end
