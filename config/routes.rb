Rails.application.routes.draw do

  # resources :restaurants, :menu_groups, :foods, :items, only: [:index, :show] do
  #   resources :reviews
  # end

  resources :restaurants, only: [:index, :show] do
    resources :menu_groups, :foods, :addresses, only: [:index, :show]
    resources :items, only: [:index, :show] do
       resources :prices, only: [:index, :show]
     end
   end


  resources :reviews
  resources  :tags, :ingredients

  namespace :admin do
    resources :users
    resources :restaurants do
      resources :menu_groups, :foods, :choices, :addresses
      resources :items do
        resources :prices
        post 'add_food', to: 'foods#add_item_food', as: "add_food"
      end
    end
    get 'menu_groups', to: 'menu_groups#all', as: "menu_groups"
    get 'items', to: 'items#all', as: "items"
    get 'foods', to: 'foods#all', as: "foods"

    post 'items/update_item_price/:id', to: 'items#update_price', as: "items_update_price"
  end


  devise_for :users #, :path_prefix => 'admin'
  # The priority is based upon order of creation: first created -> highest priority.


  get '/get_menu_groups_by_restaurant', to: 'admin/foods#get_menu_groups_by_restaurant', as: "get_menu_groups_by_restaurant"
  get '/create_user_rating',            to: 'reviews#create_user_rating',                as: "create_user_rating"
  get '/restaurant_item_filter',        to: 'admin/items#restaurant_item_filter',        as: "restaurant_item_filter"

  root 'base#home'
  get  'admin_root',                    to: 'admin#home', as: "admin_root"
end
