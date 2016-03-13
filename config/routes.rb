Rails.application.routes.draw do
  root 'base#home'
  get  'admin_root',                    to: 'admin#home', as: "admin_root"

  resources :restaurants, :ingredients, :tags, only: [:index, :show] do
    resources :menu_groups, :foods, :addresses, :choices, only: [:index, :show]
    resources :items, only: [:index, :show] do
       resources :prices, only: [:index, :show]
     end
   end


  resources :reviews

  namespace :admin do
    resources :users, :tags
    resources :ingredients do
      post 'add_tag', to: 'ingredients#add_tag', as: 'add_tag'
      post 'remove_tag', to: 'ingredients#remove_tag', as: 'remove_tag'
    end
    resources :restaurants do
      resources :menu_groups, :addresses
      resources :items do
        resources :prices
        post 'add_new_food', to: 'items#add_new_food', as: "add_new_food"
        post 'add_new_price', to: 'items#add_new_price', as: "add_new_price"
        post 'add_new_choice', to: 'items#add_new_choice', as: "add_new_choice"
        post 'add_food', to: 'items#add_food', as: "add_food"
        post 'add_choice', to: 'items#add_choice', as: "add_choice"
      end
      resources :foods do
        post 'add_ingredient', to: 'foods#add_ingredient', as: "add_ingredient"
        post 'add_ingredient_by_name', to: 'foods#add_ingredient_by_name', as: "add_ingredient_by_name"
        post 'remove_ingredient', to: 'foods#remove_ingredient', as: "remove_ingredient"
      end
      resources :choices do
        post 'add_food', to: 'choices#add_food', as: "add_food"
      end
    end
    get 'menu_groups', to: 'menu_groups#all', as: "menu_groups"
    get 'items', to: 'items#all', as: "items"
    get 'foods', to: 'foods#all', as: "foods"

  end


  devise_for :users #, :path_prefix => 'admin'
  # The priority is based upon order of creation: first created -> highest priority.


  get '/get_menu_groups_by_restaurant', to: 'admin/foods#get_menu_groups_by_restaurant', as: "get_menu_groups_by_restaurant"
  get '/create_user_rating',            to: 'reviews#create_user_rating',                as: "create_user_rating"
  get '/restaurant_item_filter',        to: 'admin/items#restaurant_item_filter',        as: "restaurant_item_filter"

end
