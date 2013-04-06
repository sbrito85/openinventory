Openinventory::Application.routes.draw do
  resources :people


  resources :assets


  devise_for :users

  resources :offices


  resources :devices


  resources :clients


  get "pages/home"

  root :to => 'assets#index'
end
