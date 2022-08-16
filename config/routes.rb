Rails.application.routes.draw do
=begin
  resources :foods
  resources :restaurants
=end
  devise_for :users
  resources :users do
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
