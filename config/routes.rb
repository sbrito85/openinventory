Openinventory::Application.routes.draw do
  resources :domains


  resources :people do
  	collection { post :import }
  end


  resources :assets do
    collection { post :import }
  end


  devise_for :users

  resources :offices


  resources :devices do
    collection { post :import }
  end


  resources :clients


  get "pages/home"

  root :to => 'pages#home'
end
