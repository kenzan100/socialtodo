Socialtodo::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
      get '/users/sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :tasks

  match "/my" => "tasks#my", :via => :get
  match "/tasks/ganbare" => "tasks#ganbare", :via => :post

  root :to => "tasks#index"
end
