Rails.application.routes.draw do

  root to: 'homes#top'

 # devise関連
  devise_for :customers, controllers: {
  	registrations: 'customers/registrations',
  	passwords: 'customers/passwords',
    sessions: 'customers/sessions'}

 # 顧客用サイトのrouting
   get 'homes/top' => 'homes#top', as: 'customer_top'
   get 'homes/about' => 'homes#about', as: 'customer_about'
 resources :customers, only: [:edit, :show, :update]
      get 'customers/:id/withdraw' => 'customers#withdraw', as: 'customer_withdraw'
      patch 'customers/:id/withdraw' => 'customers#withdraw_done', as: 'customer_withdraw_done'

 resources :products, only: [:index, :show]

 resources :cart_items, only: [:index, :create, :update, :destroy]
 resources :orders, only: [:new, :index, :create, :show]
      get'orders/confirm' => 'orders#confirm', as: 'order_confirm'
      get 'orders/thanks' => 'orders#thanks', as: 'order_thanks'

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
