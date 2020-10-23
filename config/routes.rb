Rails.application.routes.draw do
  root 'users#index'

  resources :users
  resources :questions, except: %i[show new index]
  resources :sessions, only: %i[new create destroy]
  resources :hash_tags, param: :name, only: %i[show]

  get 'sign_up' => 'users#new'
  get 'log_out' => 'sessions#destroy'
  get 'log_in' => 'sessions#new'
end
