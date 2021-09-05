Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'

  resources :users, only: [:index, :show, :edit, :update]
  get '/home/about' => 'homes#about'

  resources :books, only: [:index, :create, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

end