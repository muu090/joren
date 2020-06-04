Rails.application.routes.draw do
  get 'home/about'
  devise_for :users
  resources :users,only: [:show,:edit,:update,:destroy] do
    resources :check_ins,only: [:index, :create]
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#follow_index', as: 'follows'
    get 'followers' => 'relationships#follower_index', as: 'followers'
  end
  resources :stores, only: [:index, :show] do
    resources :comments, only: [:create, :destroy] do
      resource :likes, only: [:create, :destroy]
    end
  end

  get 'user/:user_id/stores/:store_id' => 'check_ins#show', as: 'user_check_in'
  root 'home#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
