MitnadvimNet::Application.routes.draw do

  resources :requests do
    resources :responses
  end

  resources :schools
  resources :users
  resources :volunteers, :only => [:new, :create, :show]

  root :to => "requests#index"
  match 'widgets' => 'application#widgets'

  get "sign_in"  => "sessions#new", :as => "sign_in"
  get "sign_out" => "sessions#destroy", :as => "sign_out"

  resources :sessions

end
