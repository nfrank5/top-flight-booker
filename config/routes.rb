Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :flights do
    collection do
      get "search"
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
  root 'flights#index'
end
