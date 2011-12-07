Fmn::Application.routes.draw do
  get "sign_up" => "users#new", :as => "sign_up"
  
  get "log_in" => "sessions#new", :as => "log_in"
  
  get "log_out" =>  "sessions#destroy", :as => "log_out"
  
  
  root :to => 'users#new'
  resources :users
  resources :sessions
end
