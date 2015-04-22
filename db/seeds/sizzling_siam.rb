module SizzlingSiam
   siam         = Restaurant.find_or_create_by(name: "Sizzling Siam", slogan: "Authentic Thai food")
   siam_noodles = MenuGroup.find_or_create_by(restaurant_id: siam.id, name: "Noodle Dishes", description: "Rice noodles and...")

   Food.find_or_create_by(restaurant_id: siam.id, menu_group_id: siam_noodles.id, name: "Pad Thai", description: "With Tofu", price_low: 9)
   
   puts "SizzlingSiam seeded"
end
