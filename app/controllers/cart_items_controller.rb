class CartItemsController < ApplicationController
 #before_action :set_default_values
  # Use this if you wanna set default values only when creating a new record.
  #after_initialize :set_default_values, if: :new_record?

	def create
		@cart_item = Cart_Item.new
	end

	def destory #全部消去メソッドにする
	end

	def edit
	end

	def show
#		@customer = Customer.find(params[:id])
		@cart_item = Cart_Item.find(params[:cart_id])
		@cart_items = Product.all
#		@cart_items = current_customer.cart_items
	end

	def update_item
		@cart_item.save
		redirect_to current_cart
	end

	def delete_item
		@cart_item.destory
		redirect_to current_cart
	end


  private

  def set_default_values #デフォルトの個数を０に設定
    self.quanitity   ||= 0
  end

end
