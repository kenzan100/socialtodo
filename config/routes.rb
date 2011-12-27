Socialtodo::Application.routes.draw do
  resources :friends

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
      get '/users/sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  resources :tasks
  resources :users
  match "/my" => "tasks#my", :via => :get

  root :to => "tasks#index"
end
