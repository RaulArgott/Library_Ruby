Rails.application.routes.draw do
  get 'home/index'

  resources :book_loans
  resources :loans
  resources :favourites
  resources :tags
  resources :books
  resources :bookshelves
  resources :publishers
  resources :authors 
  resources :users_admin, :controller => 'users', except: :create
  devise_for :users, :controllers => { :registrations => 'registrations'}
  devise_scope :user do
    authenticated :user do
      root 'loans#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'home#index', as: :unauthenticated_root
    end
  end
  post 'users/create_user' => 'users#create', as: :create_user
  root to:'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
