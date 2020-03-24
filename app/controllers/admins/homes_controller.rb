class Admins::HomesController < ApplicationController
	before_action :authenticate_admin!

	def top #あとで
		from  = Time.zone.now.at_beginning_of_day
		to = (from + 1.day)
		@orders = Order.where(created_at: from...to)
	end
end
