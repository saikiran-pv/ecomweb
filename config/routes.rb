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

  get 'carts/:id', to: "carts#show", as:"cart"
  delete 'carts/:id', to: "carts#destroy"

  post 'line_items/:id/add', to: "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce', to: "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' , to: "line_items#create"
  get 'line_items/:id' , to: "line_items#show", as: "line_item"
  delete 'line_items/:id', to:"line_items#destroy"

  resources :stores do
    resources :products, param: "code"
  end
  
  resources :categories do
    resources :products, param: "code"
  end

  namespace :admin do
    resources :users
    resources :products, param: "code"
    resources :stores
    resources :categories, param: "category_name"
  end

  get "/admin/authenticate", to: "admins#authenticate", as:"super_admin_authenticate"
  post "/admin/validate", to: "admins#validate", as:"super_admin_validate"
  get "/admin/dashboard", to: "admins#dashboard", as:"super_admin_dashboard"

end
