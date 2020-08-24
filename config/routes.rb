Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :places, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end
end
