Rails.application.routes.draw do
  root to: 'home#top'
  get '/home/about', to: 'home#about'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  	resource :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
end
