Rails.application.routes.draw do
  resources :foods
  resources :restaurants
  devise_for :users
  resources :users do
    get '/:id', to: 'users#show'
    get '/restaurants/:id', to: 'restaurants#show'
    get '/restaurants/:id/edit', to: 'restaurants#edit'
    get '/restaurants/:id/foods/new', to: 'foods#new'
    resources :restaurants do
      resources :foods
    end
  end
  controller :restaurants do
    get :qr_code_generator
    get :qr_code_download
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#index"

end
