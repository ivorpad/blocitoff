Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:update, :show, :index] do
      resources :items, only: [:create]
  end

  get 'users/show'
  root to: 'welcome#index'

end
