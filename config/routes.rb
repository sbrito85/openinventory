Openinventory::Application.routes.draw do
  resources :domains


  resources :people do
  	collection { post :import }
  end


  resources :assets 


  devise_for :users

  resources :offices


  resources :devices


  resources :clients


  get "pages/home"

  root :to => 'pages#home'
end
