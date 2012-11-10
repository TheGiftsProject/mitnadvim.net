MitnadvimNet::Application.routes.draw do

  resources :requests do
    resources :responses
  end

  resources :schools
  resources :users
  resources :volunteers, :only => [:new, :create, :show]

  root :to => 'application#homepage'
  match 'widgets' => 'application#widgets'

  get "log_in"  => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"

  resources :sessions

end
