Rails.application.routes.draw do
  get 'home/about'
  devise_for :users
  resources :users,only: [:show,:edit,:update,:destroy] do
    resources :check_ins,only: [:index,:show, :create]
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#following', as: 'followings'
    get 'followers' => 'relationships#follower', as: 'followers'
  end
  resources :stores, only: [:index, :show] do
    resources :comments, only: [:create, :destroy] do
      resource :likes, only: [:create, :destroy]
    end
  end
  
  root 'home#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
