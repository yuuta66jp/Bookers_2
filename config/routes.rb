Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:create, :show, :index, :edit, :update, :destroy]

  root 'home#top'
  get 'home/about' => 'home#about'

end
