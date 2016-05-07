Rails.application.routes.draw do

  resources :topics do
 # #34
     resources :SponsoredPosts, except: [:index]
   end

   get 'about' => 'welcome#about'

   root 'welcome#index'

 end
