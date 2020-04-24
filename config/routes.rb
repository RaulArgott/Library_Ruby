Rails.application.routes.draw do
  match '/users',   to: 'users#index',   via: 'get'
  get 'users/:id' => 'users#show', as: :user
  resources :users
  resources :loans
  resources :favourites
  resources :tags
  resources :books
  resources :bookshelves
  resources :publishers
  resources :authors
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'pages#home', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  root to:'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
