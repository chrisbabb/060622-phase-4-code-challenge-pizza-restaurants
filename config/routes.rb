Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show, :destroy]
  resources :restaurant_pizzas, only: :create
  resources :pizzas, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
