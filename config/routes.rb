Rails.application.routes.draw do
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  devise_for :users
  root 'home#top'
  get 'home/about'
