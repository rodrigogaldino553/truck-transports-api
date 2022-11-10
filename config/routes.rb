Rails.application.routes.draw do
  resources :products
  resources :trucks do
    resources :deliveries
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
