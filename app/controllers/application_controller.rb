class ApplicationController < ActionController::Base

# helper_method :current_cart
# #カートidがあれば使用、なければカスタマーidをもとにカートidを作成する
# #複数のページにまたがるのでApplicationに記載
#   def current_cart
#     if session[:customer_id]
#       @cart = Customer.find(session[:customer_id])
#     else
#       @cart = Customer.create
#       session[:customer_id] = @customer.id
#     end
#   end
end
