Rails.application.routes.draw do
  resources :posts do 
    resources :comments
  end
  resources :schedules do 
    resources :shifts
  end
  resources :routes do
    resources :stops
  end
  resources :check_entries
  resources :items
  post "/", to: "users#login"
  post "/update", to: "users#update"
  post "/users", to: "users#create"
  post "/users/:id/delete", to: "users#deactivate"
  get '/logout', to: 'users#logout'
  get '/logged_in', to: 'users#logged_in'
  get '/contacts', to: 'users#contact_list'
  get '/reset', to: 'users#reset_password'
  post '/report', to: 'reports#show'
  resources :messages, only: [:create, :index, :destroy]
  delete '/all_messages', to: 'messages#destroy_all'
  resources :conversations, only: [:create, :index]
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
