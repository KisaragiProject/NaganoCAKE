Rails.application.routes.draw do
  devise_for :customers

 # 顧客用サイトのrouting
 resources :customers, only: [:edit, :show, :update]
   get 'customers/withdraw' => 'customers#withdraw', as: 'customer_withdraw_path'
   patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw_path'
 resources :products, only: [:index, :show]
 resources :cart_items, only: [:index, :create, :update, :destroy]
 resources :orders, only: [:new, :index, :create, :show]
   get'orders/confirm' => 'orders#confirm', as: 'order_confirm_path'
   get 'orders/thanks' => 'orders#thanks', as: 'order_thanks_path'
 resources :addresses, only: [:index, :create, :edit, :update, :destroy]
end
