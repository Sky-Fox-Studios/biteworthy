Rails.application.routes.draw do

  resources :restaurants, :menu_groups, :foods, :items, only: [:index, :show] do
      resources :favorites
   end
   resources  :tags
   #TODO user favorites.
#    resources :restaurants, only: [:index, :show] do
#       resources :menu_groups, only: [:index, :show] do
#          resources :food_items, only: [:index, :show]
#       end
#    end

     namespace :admin do
       resources :restaurants, :menu_groups, :foods, :items, :users, :favorites
     end


   devise_for :users #, :path_prefix => 'admin'
     # The priority is based upon order of creation: first created -> highest priority.


  get '/get_menu_groups_by_restaurant', to: 'admin/foods#get_menu_groups_by_restaurant', :as => "get_menu_groups_by_restaurant"
  get '/restaurant_item_filter', to: 'admin/items#restaurant_item_filter', :as => "restaurant_item_filter"
  get '/admin_home', to: 'admin#home', :as => "admin_home"

   root 'base#home'
end
