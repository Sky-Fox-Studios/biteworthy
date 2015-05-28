module Rgps
  rgps  = Restaurant.find_or_create_by(name: "RGP's", slogan: "Flame Grilled Wraps")

  rgps_wraps       = MenuGroup.find_or_create_by(restaurant_id: rgps.id, name: "Flame Grilled Wraps", 
    description: "Served warm on our flame grilled crusts & come with choice of REGULAR OR BARBECUE potato chips or cole slaw")
  rgps_salads      = MenuGroup.find_or_create_by(restaurant_id: rgps.id, name: "Salads", description: "Add Chicken to any salad for $1.50")

  Item.find_or_create_by(restaurant_id: rgps.id, menu_group_id: rgps_wraps.id, name: "Roasted Chicken or Turkey Breast", 
    description: "With the Freshest Combination of Roma Tomatoes, Red Onion, Green Peppers, Carrots, Crisp Romaine Lettuce, and Choice of Cheese and Dressing.")
  Item.find_or_create_by(restaurant_id: rgps.id, menu_group_id: rgps_wraps.id, name: "Pulled Pork BBQ", 
    description: "Smoked Pulled Pork, Cheddar Cheese, Red Onion, Black Beans, Homemade Cole Slaw, and our Classic BBQ Sauce.")
  Item.find_or_create_by(restaurant_id: rgps.id, menu_group_id: rgps_wraps.id, name: "Caesar Salad Wrap", 
    description: "Crisp Romaine Lettuce, Croutons, Pecorino Romano Cheese, and our Caesar Dressing.")
  Item.find_or_create_by(restaurant_id: rgps.id, menu_group_id: rgps_wraps.id, name: "Veggie", 
    description: "Sweet roasted red peppers, sweet corn, roma tomatoes, red onion, green pepper, carrots, crisp romaine lettuce and choice of Cheese and Dressing.")
  Item.find_or_create_by(restaurant_id: rgps.id, menu_group_id: rgps_salads.id, name: "Full House", 
    description: "Romaine Lettuce with Roma Tomatoes, Red Onion, Green Peppers, Carrots, Cucumbers, Roasted Red Peppers.")

  puts "Rgps seeded"
end
