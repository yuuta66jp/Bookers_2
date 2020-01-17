Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  get 'users/top'
  get 'users/edit'
  get 'users/update'
  root 'users#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
