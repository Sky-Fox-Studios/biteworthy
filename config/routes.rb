Rails.application.routes.draw do

  resources :restaurants, :ingredients, only: [:index, :show] do
    resources :menu_groups, :foods, :addresses, :extras, only: [:index, :show]
    resources :items, only: [:index, :show] do
       resources :prices, only: [:index, :show]
     end
   end


  resources :reviews, :tags

  namespace :admin do
    root 'layouts#home'
    resources :users, :tags
    resources :ingredients do
      post 'add_tag', to: 'ingredients#add_tag', as: 'add_tag'
      post 'remove_tag', to: 'ingredients#remove_tag', as: 'remove_tag'
    end
    resources :restaurants do
      resources :menus
      resources :menu_groups do
        post 'remove_item', to: 'foods#remove_item', as: "remove_item"
      end
      resources :addresses
      resources :items do
        resources :prices
        post 'add_new_food',      to: 'items#add_new_food',      as: "add_new_food"
        post 'add_new_price',     to: 'items#add_new_price',     as: "add_new_price"
        post 'add_new_extra',  to: 'items#add_new_extra',  as: "add_new_extra"
        post 'add_food',          to: 'items#add_food',          as: "add_food"
        post 'add_extra',      to: 'items#add_extra',      as: "add_extra"
        post 'remove_menu_group', to: 'items#remove_menu_group', as: "remove_menu_group"
        post 'remove_food',       to: 'items#remove_food',       as: "remove_food"
        post 'remove_extra',   to: 'items#remove_extra',   as: "remove_extra"
        post 'remove_photo',   to: 'items#remove_photo',   as: "remove_photo"

      end
      resources :foods do
        post 'add_ingredient', to: 'foods#add_ingredient', as: "add_ingredient"
        post 'add_ingredient_by_name', to: 'foods#add_ingredient_by_name', as: "add_ingredient_by_name"
        post 'remove_ingredient', to: 'foods#remove_ingredient', as: "remove_ingredient"
      end
      resources :extras do
        resources :prices
        post 'add_new_price', to: 'extras#add_new_price', as: "add_new_price"
        post 'add_foods',     to: 'extras#add_foods',     as: "add_foods"
        post 'add_new_food',  to: 'extras#add_new_food',  as: "add_new_food"
        post 'remove_food',   to: 'extras#remove_food',   as: "remove_food"
      end
    end
    get 'menus',       to: 'menus#all',       as: "menus"
    get 'menu_groups', to: 'menu_groups#all', as: "menu_groups"
    get 'items',       to: 'items#all',       as: "items"
    get 'foods',       to: 'foods#all',       as: "foods"

  end


  devise_for :users #, :path_prefix => 'admin'
  get 'me', to: 'users#show', as: 'me'


  get '/get_menu_groups_by_restaurant', to: 'admin/foods#get_menu_groups_by_restaurant', as: "get_menu_groups_by_restaurant"
  get '/create_user_rating',            to: 'reviews#create_user_rating',                as: "create_user_rating"
  get '/restaurant_item_filter',        to: 'admin/items#restaurant_item_filter',        as: "restaurant_item_filter"
  root 'layouts#home'
  # get  'admin_root',                    to: 'admin#home', as: "admin_root"

end
