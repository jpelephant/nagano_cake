Rails.application.routes.draw do
  devise_for :admins
  devise_for :costomers
  
  get 'homes/about' => "homes#about"
  root to: 'homes#top'
  resources :items, only: [:index, :show]
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :customers, except: [:new, :index, :update]
  get 'customers' => 'customers#withdrawal'
  resources :cart_items, only: [:update, :create, :destroy]
  delete 'cart_items' => 'cart_items#destroy_all'
  resources :orders, only: [:new, :index, :show]
  get 'orders' => 'orders#verification'
  get 'orders' => 'orders#thanks'
  patch 'orders' => 'orders#confirm'
  resources 'shipping_oaddress'
  
  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]
    get 'homes' => 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, except: [:new, :show, :destroy]
    resources :customers, except: [:new, :create, :destroy]
    get 'order_show' => 'order_show#show'
    patch 'orders' => 'orders#update'
    patch 'order_datails' => 'order_datails#up'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end