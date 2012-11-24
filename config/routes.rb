MitnadvimNet::Application.routes.draw do

  resources :requests do

    member do
      put :close
    end


    resources :responses
  end

  resources :schools
  resources :users, :only => [:new, :create, :show]

  root :to => "requests#index"
  match 'widgets' => 'application#widgets'

  get "sign_in"  => "sessions#new", :as => "sign_in"
  get "sign_out" => "sessions#destroy", :as => "sign_out"

  resources :sessions

end
