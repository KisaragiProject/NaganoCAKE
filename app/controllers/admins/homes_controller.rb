class Admins::HomesController < ApplicationController
	# ログイン機能実装できるまでコメントアウト
	# before_action :authenticate_admin!

	def top #あとで
		@orders = Order.all
    	@today_orders = @orders[:created_at].to_s.match(/#{Date.today.to_s}.+/)) 
	end
end
