Rails.application.routes.draw do
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "products#index"
  resources :products,only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :products do
    resources :orders, :index
  end
end