Rails.application.routes.draw do
  devise_for :users

  root "products#home" 
  get "/home", to: "products#home", as: "home_user"
  get "/all_products", to: "products#all_products", as: "all_products"
  get "/record", to: "products#record", as: "record"
  
  resources :users do
    resources :addresses
  end

  resources :categories, param: "category_name"
  resources :products, param: "code"
  resources :orders
  resources :stores

  resources :stores do
    resources :products, param: "code"
  end
  
  resources :categories do
    resources :products, param: "code"
  end

  resources :products, param: "code" do
    resources :reviews
  end

  get '/cart', to: "carts#show", as:"cart"
  delete 'carts/:id', to: "carts#destroy"
  post '/carts/add_to_cart', to: "carts#add_to_cart", as:"add_to_cart"
  delete '/carts/remove_from_cart/:id', to: "carts#remove_from_cart", as: "remove_from_cart"
  post 'carts/empty_cart', to: "carts#empty_cart", as: "empty_cart"
  patch 'carts/update_cart/:id', to: "carts#update_cart", as: "update_cart"
  get '/error', to:"carts#error", as:"error"
 

  post 'line_items/:id/add', to: "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce', to: "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' , to: "line_items#create"
  get 'line_items/:id' , to: "line_items#show", as: "line_item"
  delete 'line_items/:id', to:"line_items#destroy"

  post '/place_order', to:"carts#place_order", as:"place_order"
  get '/thank_you', to: 'orders#thank_you'
  get '/checkout', to: 'carts#checkout', as:"checkout"

  namespace :admin do
    resources :users
    resources :products, param: "code"
    resources :stores
    resources :categories, param: "category_name"
    resources :orders
    
    resources :stores do
      resources :products, param: "code"
    end
    
    resources :categories do
      resources :products, param: "code"
    end
  end

  get "/admin/dashboard", to: "admin/users#dashboard", as:"admin_dashboard"
end
