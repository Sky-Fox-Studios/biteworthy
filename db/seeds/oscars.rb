module Oscars
  oscars          = Restaurant.find_or_create_by(name: "Oscar's", slogan: "", main_image_url: "")
  default_menu    = oscars.menus.create

  oscars_favorites = MenuGroup.find_or_create_by(restaurant_id: oscars.id, name: "Oscar's Favorites", description: "", is_food_group: false)
  oscars_favorites.menus << default_menu






end