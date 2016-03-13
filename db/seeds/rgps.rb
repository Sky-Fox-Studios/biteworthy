module Rgps
  rgps  = Restaurant.find_or_create_by(name: "RGP's", slogan: "Flame Grilled Wraps",
  main_image_url: "rgps.jpg")
  puts "Rgps Restaurant"

  rgps_wraps       = MenuGroup.find_or_create_by(restaurant_id: rgps.id, name: "Flame Grilled Wraps", is_food_group: true,
    description: "Served warm on our flame grilled crusts & come with choice of REGULAR OR BARBECUE potato chips or cole slaw")
  puts "Rgps rgps_wraps"

  rgps_wrap_items = [
    ["Roasted Chicken or Turkey Breast", "With the Freshest Combination of Roma Tomatoes, Red Onion, Green Peppers, Carrots, Crisp Romaine Lettuce, and Choice of Cheese and Dressing.",
       "Roma Tomatoes, Red Onion, Green Pepper, Carrots, Romaine Lettuce", "Cheese, Dressing"],
    ["Pulled Pork BBQ", "Smoked Pulled Pork, Cheddar Cheese, Red Onion, Black Beans, Homemade Cole Slaw, and our Classic BBQ Sauce.",
       "Smoked pulled pork, Cheddar cheese, Red onion, Black beans, Homemade cole slaw, BBQ sauce", nil],
    ["Veggie", "Sweet roasted red peppers, sweet corn, roma tomatoes, red onion, green pepper, carrots, crisp romaine lettuce and choice of Cheese and Dressing.",
       "red peppers, sweet corn, roma tomatoes, red onion, green pepper, carrots, romaine lettuce", "Cheese, Dressing"],
  ]

  rgps_wrap_items.each do |name, description, foods_array, choices_array|
    item = Item.find_or_create_by(restaurant: rgps,
      name: name,
      description: description,
    )
    item.menu_groups << rgps_wraps
    foods_array.split(',').each do |food|
      food = Food.find_or_create_by(name: food.downcase, restaurant: rgps)
      item.foods << food
    end
    if choices_array
      choices_array.split(',').each do |choice|
        choice = Choice.find_or_create_by(name: choice.downcase, restaurant: rgps)
        item.choices << choice
      end
    end
    item.save
    puts "Rgps #{item.name} saved"

    #  prices_sizes.each do |price_size|
    #    Price.find_or_create_by(price: price_size[:price], size: price_size[:size], item: item)
    #  end
  end

  rgps_salads      = MenuGroup.find_or_create_by(restaurant_id: rgps.id, name: "Salads", description: "Add Chicken to any salad for $1.50", is_food_group: true)
  puts "Rgps Salads..."
  rgps_salad_items = [
    ["Caesar Salad", "Crisp Romaine Lettuce, Croutons, Pecorino Romano Cheese, and Dressing."],
    ["Full House", "Romaine Lettuce with Roma Tomatoes, Red Onion, Green Peppers, Carrots, Cucumbers, Roasted Red Peppers."],
  ]

  rgps_salad_items.each do |name, description|
    item = Item.find_or_create_by(restaurant: rgps,
     name: name,
     description: description)
     item.menu_groups << rgps_salads
    #  prices_sizes.each do |price_size|
    #    Price.find_or_create_by(price: price_size[:price], size: price_size[:size], item: item)
    #  end
    item.save
    puts "Rgps #{item.name} saved"
  end

  puts "Rgps seeded"
end
