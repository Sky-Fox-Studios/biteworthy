module Ingredients
  
  cheese = Ingredient.find_or_create_by(name: "Cheese", dairy: true)
  rice_noodles = Ingredient.find_or_create_by(name: "Rice Noodles", grain: true)
   
  puts "ingredients seeded"
end
