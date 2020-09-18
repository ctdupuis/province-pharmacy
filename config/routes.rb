Rails.application.routes.draw do
  get "/", to: "users#login"
  get '/logout', to: 'users#logout'
  get '/logged_in', to: 'users#logged_in'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
