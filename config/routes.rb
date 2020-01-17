Rails.application.routes.draw do

  root 'users#top'
  get '/home/about', to: 'users#about', as: 'about'
  devise_for :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:top, :index, :show, :edit, :update]
  resources :books, only: [:create, :show, :index, :edit, :update, :destroy]
end
