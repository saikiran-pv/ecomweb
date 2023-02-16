Rails.application.routes.draw do
  resources :orders
  resources :carts
  resources :products   
  
  resources :roles
  resources :users
 
  root "users#home" 
  get "/home", to: "users#home", as: "home_user"
  get "/all_products", to: "products#all_products", as: "all_products"

  # resources :stores do
  #   resources :products 
  # end

  scope '/admin' do
    resources :stores do
      resources :products
    end
  end
end
