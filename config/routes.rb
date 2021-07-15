Rails.application.routes.draw do
  namespace :admin do
    root to: 'movies#index'
    get 'main', to: 'main#index', as: :main
    resources :categories, except: [:show]
    resources :movies
    get 'users', to: 'users#index', as: :users
  end

  match 'movies/:id/rate/:rating', to: 'ratings#index', via: [:get, :post], as: :rating
  get 'category/:category', to: 'movies#category', as: :category
  root to: "movies#index"

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', registration: 'register' }

  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
