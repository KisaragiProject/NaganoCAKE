Rails.application.routes.draw do
  devise_for :customers

 # 顧客用サイトのrouting
   get 'homes/top' => 'homes#top', as: 'customer_top_path'
   get 'homes/about' => 'homes#about', as: 'customer_about_path'
 resources :customers, only: [:edit, :show, :update]
   get 'customers/withdraw' => 'customers#withdraw', as: 'customer_withdraw_path'
   patch 'customers/withdraw' => 'customers#withdraw', as: 'customer_withdraw_done_path'
 resources :products, only: [:index, :show]
 resources :cart_items, only: [:index, :create, :update, :destroy]
 resources :orders, only: [:new, :index, :create, :show]
   get'orders/confirm' => 'orders#confirm', as: 'order_confirm_path'
   get 'orders/thanks' => 'orders#thanks', as: 'order_thanks_path'
 resources :addresses, only: [:index, :create, :edit, :update, :destroy]

 # 管理者用サイトのrouting
 namespace :admins do
 	devise_for :admins
 end

 namespace :admins do
 	get 'homes/top' => 'homes#top', as:'admin_top_path'
 end

 namespace :admins do
 	resources :customers, only: [:index, :edit, :show, :update]
 end

 namespace :admins do
 	resources :products, only: [:index, :create, :new, :edit, :show, :update]
 end

 namespace :admins do
 	resources :orders, only: [:index, :create, :show, :update]
 end

 namespace :admins do
 	resources :genres, only: [:index, :create, :edit, :update]
 end

 namespace :admins do
 	resources :search, only: :search
 end
end
