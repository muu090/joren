Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:edit,:update,:destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#following', as: 'follows'
    get 'followers' => 'relationships#follower', as: 'followers'
  end
  resources :stores do
    resources :comments, only: [:create, :destroy] do
      resource :likes, only: [:create, :destroy]
    end
  end

  root 'users#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
