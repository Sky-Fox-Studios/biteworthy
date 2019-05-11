Rails.application.routes.draw do

  get 'about', to: 'pages#about'
  get 'levels', to: 'pages#levels'
  get 'privacy-policy', to: 'pages#privacy_policy'
  get 'terms-of-service', to: 'pages#terms_of_service'
  resources :reports, only: [:new, :create]
  resources :ingredients, only: [:index, :show]
  resources :restaurants, only: [:index, :show] do
    resources :menu_groups, :foods, :addresses, :extras, only: [:index, :show]
    resources :items, only: [:show] do
       resources :prices, only: [:index, :show]
     end
   end

  #Search
  get 'search', to: 'search#home'
  get 'ingredient_search', to: 'search#ingredient_search'
  get 'food_search', to: 'search#food_search'
  get 'tag_search', to: 'search#tag_search'
  get 'choice_search', to: 'search#choice_search'
  post 'search/advanced', to: 'search#advanced'

  resources :reviews, :tags
  get 'reviews/lookup', to: 'reviews#lookup', as: "lookup"

  namespace :admin do
    root 'layouts#home'
    resources :users, :tags
    resources :ingredients do
      post 'add_tag', to: 'ingredients#add_tag', as: 'add_tag'
      post 'remove_tag', to: 'ingredients#remove_tag', as: 'remove_tag'
      resources :varieties
    end
    resources :restaurants do
      resources :menus
      resources :menu_groups do
        post 'remove_item', to: 'foods#remove_item', as: "remove_item"
      end
      resources :addresses
      resources :items do
        resources :prices
        #add new X
        post 'add_new',           to: 'items#add_new',           as: "add_new"
        post 'add_new_tag',       to: 'items_ajax#add_new_tag',  as: "add_new_tag"
        post 'add_new_food',      to: 'items_ajax#add_new_food', as: "add_new_food"
        post 'add_new_price',     to: 'items#add_new_price',     as: "add_new_price"
        post 'add_new_extra',     to: 'items#add_new_extra',     as: "add_new_extra"
        post 'add_tag',           to: 'items_ajax#add_tag',      as: "add_tag"
        post 'add_foods',         to: 'items_ajax#add_foods',    as: "add_foods"
        post 'add_extra',         to: 'items#add_extra',         as: "add_extra"
        #remove new X
        post 'remove_menu_group', to: 'items#remove_menu_group', as: "remove_menu_group"
        post 'remove_tag',        to: 'items_ajax#remove_tag',   as: "remove_tag"
        post 'remove_tags',       to: 'items_ajax#remove_tags',  as: "remove_tags"
        post 'remove_food',       to: 'items_ajax#remove_food',  as: "remove_food"
        post 'remove_extra',      to: 'items#remove_extra',      as: "remove_extra"
        post 'remove_photo',      to: 'items#remove_photo',      as: "remove_photo"
        post 'tag_up',            to: 'items_ajax#tag_up',       as: "tag_up"

      end
      resources :foods do
        post 'add_new_tag',            to: 'foods_ajax#add_new_tag',       as: "add_new_tag"
        post 'add_tag',                to: 'foods_ajax#add_tag',           as: "add_tag"
        post 'add_ingredient',         to: 'foods#add_ingredient',         as: "add_ingredient"
        post 'add_ingredient_by_name', to: 'foods#add_ingredient_by_name', as: "add_ingredient_by_name"
        post 'remove_ingredient',      to: 'foods#remove_ingredient',      as: "remove_ingredient"
        post 'remove_photo',           to: 'foods#remove_photo',           as: "remove_photo"
        post 'remove_tag',             to: 'foods_ajax#remove_tag',        as: "remove_tag"
        post 'remove_tags',            to: 'foods_ajax#remove_tags',       as: "remove_tags"
        post 'tag_up',                 to: 'foods_ajax#tag_up',            as: "tag_up"
      end
      resources :extras do
        #price
        resources :prices
        post 'add_new_price', to: 'prices#add_new_price', as: "add_new_price"
        #food
        post 'add_new_food',  to: 'extras_ajax#add_new_food',  as: "add_new_food"
        post 'add_foods',     to: 'extras_ajax#add_foods',     as: "add_foods"
        post 'remove_food',   to: 'extras_ajax#remove_food',   as: "remove_food"
        #photo
        post 'remove_photo',  to: 'extras#remove_photo',  as: "remove_photo"
        #Tag actions
        post 'add_new_tag',   to: 'extras_ajax#add_new_tag',  as: "add_new_tag"
        post 'add_tag',       to: 'extras_ajax#add_tag',      as: "add_tag"
        post 'remove_tag',    to: 'extras_ajax#remove_tag',   as: "remove_tag"
        post 'remove_tags',   to: 'extras_ajax#remove_tags',  as: "remove_tags"
        post 'tag_up',        to: 'extras_ajax#tag_up',       as: "tag_up"
      end
    end
    resources :reports
    get 'menus',       to: 'menus#all',       as: "menus"
    get 'menu_groups', to: 'menu_groups#all', as: "menu_groups"
    get 'items',       to: 'items#all',       as: "items"
    get 'foods',       to: 'foods#all',       as: "foods"

    scope "items" do
      get 'add_tags',  to: 'items#add_tags',       as: "add_tags"
      post 'add_tags', to: 'items_ajax#add_tags',  as: "ajax_add_tags"
    end
    namespace :ajax do
      # Is this a wise route?
    end
  end


  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth', sessions: 'sessions' }

  get 'me', to: 'users#show', as: 'me'
  get 'choose_tags', to: 'users#choose_tags', as: 'choose_tags'


  get '/get_menu_groups_by_restaurant', to: 'admin/foods#get_menu_groups_by_restaurant', as: "get_menu_groups_by_restaurant"
  get '/create_user_rating',            to: 'reviews#create_user_rating',                as: "create_user_rating"
  get '/restaurant_item_filter',        to: 'admin/items#restaurant_item_filter',        as: "restaurant_item_filter"
  root 'layouts#home'
  # get  'admin_root',                    to: 'admin#home', as: "admin_root"

end
