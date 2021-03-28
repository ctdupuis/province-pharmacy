Rails.application.routes.draw do
  resources :posts do 
    resources :comments
  end
  resources :schedules do 
    resources :shifts
  end
  resources :delivery_entries
  resources :check_entries
  resources :items
  post "/", to: "users#login"
  post "/update", to: "users#update"
  post "/users", to: "users#create"
  post "/users/:id/delete", to: "users#destroy"
  get '/logout', to: 'users#logout'
  get '/logged_in', to: 'users#logged_in'
  get '/contacts', to: 'users#contact_list'
  post '/report', to: 'reports#show'
  resources :messages, only: [:create, :index, :destroy]
  resources :conversations, only: [:create, :index]
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
