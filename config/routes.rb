Rails.application.routes.draw do
  resources :foods
  resources :restaurants
  devise_for :users
  resources :users do
    get '/restaurants', to: 'restaurants#restaurants'
    get '/restaurants/:id', to: 'restaurants#show'
    get '/restaurants/:id/foods/new', to: 'foods#new'
    resources :restaurants do
      resources :foods
      end
    end
    
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"

end
