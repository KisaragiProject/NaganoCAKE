Rails.application.routes.draw do
  devise_for :installs
  devise_for :customers

 # 顧客用サイトのrouting
   get 'homes/top' => 'homes#top', as: 'customer_top'
   get 'homes/about' => 'homes#about', as: 'customer_about'
 resources :customers, only: [:edit, :show, :update] do
 	collection do
      get 'customers/withdraw' => 'customers#withdraw', as: 'customer_withdraw'
      patch 'customers/withdraw' => 'customers#withdraw', as: 'customer_withdraw_done'
 	end
 end
 resources :products, only: [:index, :show]
 resources :cart_items, only: [:show,:index, :create, :update, :destroy]
 resources :orders, only: [:new, :index, :create, :show] do
 	collection do
      get'orders/confirm' => 'orders#confirm', as: 'order_confirm'
      get 'orders/thanks' => 'orders#thanks', as: 'order_thanks'
    end
 end
 resources :addresses, only: [:index, :create, :edit, :update, :destroy]

 # 管理者用サイトのrouting
 namespace :admins do
 	devise_for :admins
 end

 namespace :admins do
 	get 'homes/top' => 'homes#top', as:'top'
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
