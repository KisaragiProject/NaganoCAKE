class Admins::HomesController < ApplicationController
	# ログイン機能実装できるまでコメントアウト
	# before_action :authenticate_admin!

	def top
		@items = OrderedItem.created_today
		@count = @order_items.count
	end
end
