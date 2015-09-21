module Rgps
  rgps  = Restaurant.find_or_create_by(name: "RGP's", slogan: "Flame Grilled Wraps")

  rgps_wraps       = MenuGroup.find_or_create_by(restaurant_id: rgps.id, name: "Flame Grilled Wraps", is_food_group: true,
    description: "Served warm on our flame grilled crusts & come with choice of REGULAR OR BARBECUE potato chips or cole slaw")
  rgps_salads      = MenuGroup.find_or_create_by(restaurant_id: rgps.id, name: "Salads", description: "Add Chicken to any salad for $1.50", is_food_group: true)

  rgps_wrap_items = [
    "Roasted Chicken or Turkey Breast", "With the Freshest Combination of Roma Tomatoes, Red Onion, Green Peppers, Carrots, Crisp Romaine Lettuce, and Choice of Cheese and Dressing.",
    "Pulled Pork BBQ", "Smoked Pulled Pork, Cheddar Cheese, Red Onion, Black Beans, Homemade Cole Slaw, and our Classic BBQ Sauce.",
    "Caesar Salad", "Crisp Romaine Lettuce, Croutons, Pecorino Romano Cheese, and our Caesar Dressing.",
    "Veggie", "Sweet roasted red peppers, sweet corn, roma tomatoes, red onion, green pepper, carrots, crisp romaine lettuce and choice of Cheese and Dressing.",
    "Full House", "Romaine Lettuce with Roma Tomatoes, Red Onion, Green Peppers, Carrots, Cucumbers, Roasted Red Peppers."
  ]
  rgps_wrap_items.each do |name, description|
    item = Item.find_or_create_by(restaurant: rgps, menu_group: rgps_wraps,
     name: name,
     description: description)
    #  prices_sizes.each do |price_size|
    #    Price.find_or_create_by(price: price_size[:price], size: price_size[:size], item: item)
    #  end
  end


  puts "Rgps seeded"
end
