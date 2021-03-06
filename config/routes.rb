Rails.application.routes.draw do
  get 'penalties/:id', to: 'penalties#show', as: :penalty
  get 'penalties', to: 'penalties#index', as: :penalties
  get 'penalties/pay/:id', to: 'penalties#pay', as: :pay_penalty

  get 'favourites/index'

  get 'favourites/update'
  get 'favourites/favunfav/:id', to: 'favourites#favunfav', as: :favunfav

  get 'home/index'

  resources :book_loans
  resources :loans
  get 'return/:id', to: 'loans#return', as: :return_loan
 
  resources :tags
  resources :books
  resources :bookshelves
  resources :publishers
  resources :authors 
  resources :users_admin, :controller => 'users', except: :create
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'home#index', as: :unauthenticated_root
    end
  end
  post 'users_admin/create_user' => 'users#create', as: :create_user
  root to:'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
