module Rgps
  rgps  = Restaurant.find_or_create_by(name: "RGP's", slogan: "Flame Grilled Wraps",
  main_image_url: "rgps.jpg")
  puts "Rgps Restaurant"

  rgps_wraps       = MenuGroup.find_or_create_by(restaurant_id: rgps.id, name: "Flame Grilled Wraps", is_food_group: true,
    description: "Served warm on our flame grilled crusts & come with choice of REGULAR OR BARBECUE potato chips or cole slaw")
  rgps_salads      = MenuGroup.find_or_create_by(restaurant_id: rgps.id, name: "Salads", description: "Add Chicken to any salad for $1.50", is_food_group: true)
  puts "Rgps rgps_wraps"

  rgps_wrap_items = [
    ["Roasted Chicken or Turkey Breast", "With the Freshest Combination of Roma Tomatoes, Red Onion, Green Peppers, Carrots, Crisp Romaine Lettuce, and Choice of Cheese and Dressing.", "Roma Tomatoes, Red Onion, Green Peppers, Carrots, Romaine Lettuce, Choice of cheese, Choice of dressing"],
    ["Pulled Pork BBQ", "Smoked Pulled Pork, Cheddar Cheese, Red Onion, Black Beans, Homemade Cole Slaw, and our Classic BBQ Sauce.", "Smoked Pulled Pork, Cheddar Cheese, Red Onion, Black Beans"],
    ["Veggie", "Sweet roasted red peppers, sweet corn, roma tomatoes, red onion, green pepper, carrots, crisp romaine lettuce and choice of Cheese and Dressing.", "red peppers, sweet corn, roma tomatoes, red onion, green pepper, carrots, crisp romaine lettuce, Choice of cheese, Choice of dressing"],
  ]

  rgps_wrap_items.each do |name, description, foods_array|
    foods = []
    foods_array.split(',').each do |food|
      foods << Food.find_or_create_by(name: food, restaurant: rgps)
    end
    puts "foods"

    item = Item.find_or_create_by(restaurant: rgps,
     menu_group: rgps_wraps,
     name: name,
     description: description,
     )
     puts "Rgps item"
     item.foods = foods
     puts "Rgps foods"
     item.save
     puts "Rgps save"

    #  prices_sizes.each do |price_size|
    #    Price.find_or_create_by(price: price_size[:price], size: price_size[:size], item: item)
    #  end
  end
  puts "Rgps rgps_wrap_item"
  rgps_salad_items = [
    ["Caesar Salad", "Crisp Romaine Lettuce, Croutons, Pecorino Romano Cheese, and Dressing."],
    ["Full House", "Romaine Lettuce with Roma Tomatoes, Red Onion, Green Peppers, Carrots, Cucumbers, Roasted Red Peppers."],
  ]

  rgps_salad_items.each do |name, description|
    item = Item.find_or_create_by(restaurant: rgps, menu_group: rgps_salads,
     name: name,
     description: description)
    #  prices_sizes.each do |price_size|
    #    Price.find_or_create_by(price: price_size[:price], size: price_size[:size], item: item)
    #  end
  end

  puts "Rgps seeded"
end
