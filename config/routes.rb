Rails.application.routes.draw do
  devise_for :users

  root "users#home" 
  get "/home", to: "users#home", as: "home_user"
  get "/all_products", to: "products#all_products", as: "all_products"

  resources :users
  resources :orders
  resources :carts
  resources :categories, param: "category_name"

  scope '/store-admin' do
    resources :stores do
      resources :products
    end
  end
  
  resources :categories do
    resources :products
  end

  scope '/superadmin' do
    resources :products, param: "code"
  end

end
