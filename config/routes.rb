Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts
  resources :likes, only: [:create, :destroy]
  
  devise_for :users
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  resources :users, :only => [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
