Rails.application.routes.draw do

  resources :posts do
  	post 'comments', to: 'comments#create'
  end
  devise_for :users
  root 'posts#index'
end
