Rails.application.routes.draw do
  root 'users#index'

  resources :users
  resources :questions, except: %i[show new index]
  resource :session, only: %i[new create destroy]
  resources :hash_tags, param: :name, only: %i[show]
end
