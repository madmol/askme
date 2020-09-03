Rails.application.routes.draw do
  root 'users#index'

  resources :users, except: [:destroy]
  resources :questions, except: [:show, :new, :index]
  resources :sessions, only: [:new, :create, :destroy]

  get 'sign_up' => 'users#new'
  get 'log_out' => 'sessions#destroy'
  get 'log_in' => 'sessions#new'
  # get 'users/index'
  # get 'users/new'
  # get 'users/edit'
  # get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'show' => 'users#show'
end
