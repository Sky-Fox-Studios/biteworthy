# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if !User.exists?(:email => "skylar.bolton@gmail.com") then
   User.new(user_name: "Skylar", email: "skylar.bolton@gmail.com", password: "raistlin", approved: true, is_admin: true).save
   puts "Users Seeded"
end

ninis = Restaurant.find_or_create_by(name: "Ninis", slogan: "Food so good you wont trust the water")
siam  = Restaurant.find_or_create_by(name: "Sizzling Siam", slogan: "Authentic Thai food")
dsp   = Restaurant.find_or_create_by(name: "DSP", slogan: "New York style pizza")
rgps  = Restaurant.find_or_create_by(name: "RGP's", slogan: "Flame Grilled Wraps")
puts "Restaurants Seeded"

   
ninis_burrito =    MenuGroup.find_or_create_by(restaurant_id: ninis.id, name: "Burritos", description: "Small or large burrito filled wrapped and ready to eat")
siam_noodles =     MenuGroup.find_or_create_by(restaurant_id: siam.id, name: "Noodle Dishes", description: "Rice noodles and...")
dsp_single_slice = MenuGroup.find_or_create_by(restaurant_id: dsp.id, name: "Single Slice", description: "Basic cheese Pizza with...")
rgps_wraps =       MenuGroup.find_or_create_by(restaurant_id: rgps.id, name: "Wraps", description: "Flame grilled wraps...")
puts "Menu Groups Seeded"


FoodItem.find_or_create_by(menu_group_id: ninis_burrito.id, name: "Vegitarian Burrito", description: "Rice noodles and...", price: 10)
FoodItem.find_or_create_by(menu_group_id: siam_noodles.id, name: "Pad Thai", description: "With Tofu", price: 9)
FoodItem.find_or_create_by(menu_group_id: dsp_single_slice.id, name: "Cheese", description: "Cheese Traditional", price: 3)
FoodItem.find_or_create_by(menu_group_id: rgps_wraps.id, name: "Veggie", description: "Carrots, corn, tomatoes, green peppers, red onions, lettuce, cheese, sauce.", price: 3)
puts "Food Items Seeded"
