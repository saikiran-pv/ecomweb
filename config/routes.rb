Rails.application.routes.draw do
  devise_for :users

  root "products#home" 
  get "/home", to: "products#home", as: "home_user"
  get "/all_products", to: "products#all_products", as: "all_products"
  get "/record", to: "products#record", as: "record"
  
  resources :users 
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

  get 'carts/:id', to: "carts#show", as:"cart"
  delete 'carts/:id', to: "carts#destroy"
  post '/carts/add_to_cart', to: "carts#add_to_cart"
  get '/cart/error', to:"carts#error", as:"cart_error"

  post 'line_items/:id/add', to: "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce', to: "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' , to: "line_items#create"
  get 'line_items/:id' , to: "line_items#show", as: "line_item"
  delete 'line_items/:id', to:"line_items#destroy"

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
