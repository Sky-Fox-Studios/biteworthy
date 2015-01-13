Rails.application.routes.draw do


   resources :restaurants, :menu_groups, :food_items, only: [:index, :show]
   
   #TODO sub resources
#      resources :restaurants do
#         resources :menu_groups do
#            resources :food_items
#         end
#      end

   #TODO admin name spacing
     namespace :admin do
        resources :restaurants, :menu_groups, :food_items
     end

   
   devise_for :users
     # The priority is based upon order of creation: first created -> highest priority.
   


   get '/admin_home', to: 'admin#home', :as => "admin_home"

   root 'base#home'
end
