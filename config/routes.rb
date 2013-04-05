Openinventory::Application.routes.draw do
  resources :assets


  resources :ldapsyncs


  devise_for :users

  resources :offices


  resources :devices


  resources :clients


  get "pages/home"

  root :to => 'assets#index'
end
