Rails.application.routes.draw do
  get 'movies/:id/rate/:rating', to: 'movies#expressrate'
  get 'movies/:id/rate/:rating?page=:page', to: 'movies#expressrate'
  get 'movies/:id/rate/:rating/category/:category', to: 'movies#expressrate'
  get 'movies/:id/rate/:rating/category/:category?page=:page', to: 'movies#expressrate'
  get 'category/:category', to: 'movies#category', as: :category
  root to: "movies#index"

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', registration: 'register' }

  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
