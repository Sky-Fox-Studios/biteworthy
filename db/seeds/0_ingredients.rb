module Ingredients
  
  cheese = Ingredient.find_or_create_by(name: "Cheese", description: "the orange stuff")
   
  puts "ingredients seeded"
end
