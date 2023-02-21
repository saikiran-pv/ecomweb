Rails.application.routes.draw do
  resources :categories, param: "category_name"
  resources :orders
  resources :carts
  resources :products, param: "code"
  
  resources :roles
  resources :users
 
  root "users#home" 
  get "/home", to: "users#home", as: "home_user"
  get "/all_products", to: "products#all_products", as: "all_products"

  scope '/store-admin' do
    resources :stores do
      resources :products
    end
  end
  
  resources :categories do
    resources :products
  end
end
