ninis = Restaurant.find_or_create_by(name: "Ninis", slogan: "Food so good you wont trust the water")
siam  = Restaurant.find_or_create_by(name: "Sizzling Siam", slogan: "Authentic Thai food")
dsp   = Restaurant.find_or_create_by(name: "DSP", slogan: "New York style pizza")
rgps  = Restaurant.find_or_create_by(name: "RGP's", slogan: "Flame Grilled Wraps")
thai_k  = Restaurant.find_or_create_by(name: "Thai Kitchen", slogan: "")
puts "Restaurants Seeded"
   
ninis_burrito    = MenuGroup.find_or_create_by(restaurant_id: ninis.id, name: "Burritos", description: "Small or large burrito filled wrapped and ready to eat")
siam_noodles     = MenuGroup.find_or_create_by(restaurant_id: siam.id, name: "Noodle Dishes", description: "Rice noodles and...")
dsp_single_slice = MenuGroup.find_or_create_by(restaurant_id: dsp.id, name: "Single Slice", description: "Basic cheese Pizza with...")
rgps_wraps       = MenuGroup.find_or_create_by(restaurant_id: rgps.id, name: "Flame Grilled Wraps", description: "Served warm on our flame grilled crusts & come with choice of REGULAR OR BARBECUE potato chips or cole slaw")
rgps_salads      = MenuGroup.find_or_create_by(restaurant_id: rgps.id, name: "Salads", description: "Add Chicken to any salad for $1.50")
puts "Menu Groups Seeded"

#Siam
FoodItem.find_or_create_by(menu_group_id: siam_noodles.id, name: "Pad Thai", description: "With Tofu", price_low: 9)
#DSP
FoodItem.find_or_create_by(menu_group_id: dsp_single_slice.id, name: "Cheese", description: "Cheese Traditional", price_low: 3)
   
# RGP
FoodItem.find_or_create_by(menu_group_id: rgps_wraps.id, name: "Roasted Chicken or Turkey Breast", 
   description: "With the Freshest Combination of Roma Tomatoes, Red Onion, Green Peppers, Carrots, Crisp Romaine Lettuce, and Choice of Cheese and Dressing.", price_low: 6.35)
FoodItem.find_or_create_by(menu_group_id: rgps_wraps.id, name: "Pulled Pork BBQ", 
   description: "Smoked Pulled Pork, Cheddar Cheese, Red Onion, Black Beans, Homemade Cole Slaw, and our Classic BBQ Sauce.", price_low: 6.63)
FoodItem.find_or_create_by(menu_group_id: rgps_wraps.id, name: "Caesar Salad Wrap", 
   description: "Crisp Romaine Lettuce, Croutons, Pecorino Romano Cheese, and our Caesar Dressing.", price_low: 6.63)
FoodItem.find_or_create_by(menu_group_id: rgps_wraps.id, name: "Veggie", 
   description: "Sweet roasted red peppers, sweet corn, roma tomatoes, red onion, green pepper, carrots, crisp romaine lettuce and choice of Cheese and Dressing.", price_low: 6.35)
FoodItem.find_or_create_by(menu_group_id: rgps_salads.id, name: "Full House", 
   description: "Romaine Lettuce with Roma Tomatoes, Red Onion, Green Peppers, Carrots, Cucumbers, Roasted Red Peppers.", price_low: 5.5)
   
# Ninis
FoodItem.find_or_create_by(menu_group_id: ninis_burrito.id, name: "Chicken", 
   description: "Chicken, beans, rice, sour cream, cheese, and salsa", 
   price_low: 7.5, price_high: 8.75)
FoodItem.find_or_create_by(menu_group_id: ninis_burrito.id, name: "Barbacoa", 
   description: "Shredded beef, beans, rice, sour cream, cheese, and salsa", 
   price_low: 7.5, price_high: 8.75)
FoodItem.find_or_create_by(menu_group_id: ninis_burrito.id, name: "Carnitas", 
   description: "Shredded pork, beans, rice, sour cream, cheese, and salsa", 
   price_low: 7.5, price_high: 8.75)
FoodItem.find_or_create_by(menu_group_id: ninis_burrito.id, name: "Fish", 
   description: "Fish, spicy coleslaw, beans, rice, sour cream, cheese, and salsa", 
   price_low: 7.75, price_high: 8.95)
FoodItem.find_or_create_by(menu_group_id: ninis_burrito.id, name: "Vegetarian", 
   description: "Mixed sauteed vegetables, beans, rice, sour cream, cheese, and salsa", 
   price_low: 7.75, price_high: 8.95)
puts "Food Items Seeded"

if !User.exists?(:email => "skylar.bolton@gmail.com") then
   User.new(user_name: "Skylar", email: "skylar.bolton@gmail.com", password: "raistlin", approved: true, is_admin: true).save
   puts "Users Seeded"
end