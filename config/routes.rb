Rails.application.routes.draw do
  get 'relationships/following'
  get 'relationships/follower'
  get 'check_ins/index'
  get 'check_ins/show'
  get 'stores/show'
  get 'users/show'
  get 'users/edit'
  get 'home/top'
  get 'home/about'
  devise_for :users
  resources :users,only: [:show,:edit,:update,:destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#following', as: 'follows'
    get 'followers' => 'relationships#follower', as: 'followers'
  end
  resources :stores,only: [:show] do
    resources :comments, only: [:create, :destroy] do
      resource :likes, only: [:create, :destroy]
    end
  end

  root 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
