Rails.application.routes.draw do
  
  resources :labels, only: [:show]

  resources :topics do
    resources :posts, except: [:index]
  end
# #4
  resources :posts, only: [] do
# #5
    resources :comments, only: [:create, :destroy]
  end


   resources :users, only: [:new, :create]

   resources :sessions, only: [:new, :create, :destroy]

   get 'about' => 'welcome#about'

   root 'welcome#index'

 end
