Rails.application.routes.draw do
  root 'base#home'
  get  'admin_root',                    to: 'admin#home', as: "admin_root"

  resources :restaurants, :ingredients, only: [:index, :show] do
    resources :menu_groups, :foods, :addresses, :choices, only: [:index, :show]
    resources :items, only: [:index, :show] do
       resources :prices, only: [:index, :show]
     end
   end


  resources :reviews, :ingredients
  resources  :tags

  namespace :admin do
    resources :users
    resources :restaurants do
      resources :menu_groups, :addresses
      resources :items do
        resources :prices
        post 'add_food', to: 'items#add_food', as: "add_food"
        post 'add_choice', to: 'items#add_choice', as: "add_choice"
      end
      resources :foods do
        post 'add_ingredient_by_id', to: 'foods#add_ingredient_by_id', as: "add_ingredient_by_id"
        post 'add_ingredient_by_name', to: 'foods#add_ingredient_by_name', as: "add_ingredient_by_name"
      end
      resources :choices do
        post 'add_food', to: 'choices#add_food', as: "add_food"
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

end
