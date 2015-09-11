Rails.application.routes.draw do

  resources :restaurants, :menu_groups, :foods, :items, only: [:index, :show] do
    resources :reviews
  end

  resources :reviews, only: [:index, :show, :edit]
  resources  :tags

  namespace :admin do
    resources :restaurants, :menu_groups, :foods, :items, :prices, :users, :addresses
  end


  devise_for :users #, :path_prefix => 'admin'
  # The priority is based upon order of creation: first created -> highest priority.


  get '/get_menu_groups_by_restaurant', to: 'admin/foods#get_menu_groups_by_restaurant', :as => "get_menu_groups_by_restaurant"
  get '/create_user_rating',            to: 'reviews#create_user_rating',                :as => "create_user_rating"
  get '/restaurant_item_filter',        to: 'admin/items#restaurant_item_filter',        :as => "restaurant_item_filter"
  get '/admin_home',                    to: 'admin#home',                                :as => "admin_home"

  root 'base#home'
end
