Rails.application.routes.draw do

   resources :restaurants, :menu_groups, :food_items, only: [:index, :show]
   resources :favorites
#    resources :restaurants, only: [:index, :show] do
#       resources :menu_groups, only: [:index, :show] do
#          resources :food_items, only: [:index, :show]
#       end
#    end

     namespace :admin do
        resources :restaurants, :menu_groups, :food_items, :users, :favorites
     end

   
   devise_for :users #, :path_prefix => 'admin'
     # The priority is based upon order of creation: first created -> highest priority.


   get '/admin_home', to: 'admin#home', :as => "admin_home"

   root 'restaurants#index'
end
