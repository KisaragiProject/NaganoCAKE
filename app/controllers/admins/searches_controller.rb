class Admins::SearchesController < ApplicationController
	before_action :authenticate_admin!

	def search
		@customer = Customer.new
		@product = Product.new
		@model = params["search"]["model"]
		@content = params["search"]["content"]
		@how = params["search"]["how"]
		@datas = search_for(@how, @model, @content)
	end

# User.find_by_sql(["select * from Users where first_name || last_name like ?", "%田中太郎%"])

	private
	def match(model, content)
		if model == 'customer'
			Customer.find_by_sql(["select * from Customers where family_name || first_name LIKE ?", "#{content}"])
		elsif model == 'product'
			Product.where(name: content)
		end
	end

	def forward(model, content)
		if model == 'customer'
			Customer.where("family_name || first_name LIKE ?", "#{content}%")
		elsif model == 'product'
			Product.where("name like ?", "#{content}%")
		end
	end

	def backward(model, content)
		if model == 'customer'
			Customer.where("family_name || first_name LIKE ?", "%#{content}")
		elsif model == 'product'
			Product.where("name like ?", "%#{content}")
		end
	end

	def partical(model, content)
		if model == 'customer'
			Customer.where("family_name || first_name LIKE ?", "%#{content}%")
		elsif model == 'product'
			Product.where("name like ?", "%#{content}%")
		end
	end

	def search_for(how, model, content)
	  case how
		when 'match'
			match(model, content)
		when 'forward'
			forward(model, content)
		when 'backward'
			backward(model, content)
		when 'partical'
			partical(model, content)
	  end
	end
end
