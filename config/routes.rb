Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'home/about'=> 'homes#about'
  get '/search', to: 'cars#search'
  get 'chat/:id' => 'chats#show', as: 'chat'
  get 'user/out' => 'users#out'
  patch 'user/with_out' => 'users#with_out'
  resources :chats, only: [:create]
  resources :cars, only: [:index, :show, :new, :create]
  resources :users, only: [:index, :show,:edit, :update]
  resources :favorites, only: [:create, :destroy]
end
