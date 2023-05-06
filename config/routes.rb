Rails.application.routes.draw do
  root "people#index"

  resources :addresses do
    get "inactives", on: :collection
  end

  resources :counties do
    get "inactives", on: :collection
  end

  resources :people do
    get "inactives", on: :collection
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
end