MitnadvimNet::Application.routes.draw do

  resources :requests do
    member do
      put :close
    end

    resources :responses, :only => [:create]
  end

  resources :schools
  resources :users, :only => [:new, :create, :show]
  resources :sessions, :only => [:new, :create, :destroy]

  get "sign_in"  => "sessions#new", :as => "sign_in"
  get "sign_out" => "sessions#destroy", :as => "sign_out"

  root :to => "requests#index"

end
