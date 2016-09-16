Rails.application.routes.draw do
  resources :payment_notifications
  resources :products
  devise_for :users
  resources :carts
  resources :line_items
  root "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
