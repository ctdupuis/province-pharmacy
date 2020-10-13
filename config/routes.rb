Rails.application.routes.draw do
  resources :posts do 
    resources :comments
  end
  
  post "/", to: "users#login"
  post "/update", to: "users#update"
  get '/logout', to: 'users#logout'
  get '/logged_in', to: 'users#logged_in'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
