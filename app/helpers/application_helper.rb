module ApplicationHelper
	#timestamp表記を簡略化
	def simple_time(time)
		time.strftime("%Y-%m-%d　%H:%M　")
	end 
end
