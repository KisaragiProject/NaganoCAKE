class Admins::HomesController < ApplicationController
	# ログイン機能実装できるまでコメントアウト
	# before_action :authenticate_admin!
	def top 
		from  = Time.zone.now.at_beginning_of_day
		to = (from + 1.day)
		@orders = Order.where(created_at: from...to)
#		@orders = Order.all
    	# @today_orders = @orders.created_at.to_s.match(/#{Date.today.to_s}/)
	end
end
