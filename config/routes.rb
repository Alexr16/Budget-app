Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "expenses#index"

  resources :users, only: [:index] do
    resources :groups, only: [:index]
    resources :expenses, only: [:index]
  end
end
