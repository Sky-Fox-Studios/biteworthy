module Ingredients

#:dairy
#:fruit
#:grain
#:meat
#:nut
#:sea_food
#:vegetable


  #meats
  Ingredient.find_or_create_by(name: "Anchovy", meat: true, sea_food: true)
  chicken = Ingredient.find_or_create_by(name: "Chicken", meat: true)
  Ingredient.find_or_create_by(name: "Breast", parent_id: chicken.id, is_sub_type: true, meat: true)
  Ingredient.find_or_create_by(name: "Salami", meat: true)
  Ingredient.find_or_create_by(name: "Beef", meat: true)
  Ingredient.find_or_create_by(name: "Sausage", meat: true)
  Ingredient.find_or_create_by(name: "Pepperoni", meat: true)
  pork = Ingredient.find_or_create_by(name: "Pork", meat: true)
  Ingredient.find_or_create_by(name: "Bacon", parent_id: pork.id, meat: true)
  Ingredient.find_or_create_by(name: "Ham", parent_id: pork.id, meat: true)
  Ingredient.find_or_create_by(name: "Prosciutto", parent_id: pork.id, meat: true)
  Ingredient.find_or_create_by(name: "Shrimp", meat: true, sea_food: true)

  #Vegtables
  onion = Ingredient.find_or_create_by(name: "Onion", vegetable: true)
  Ingredient.find_or_create_by(name: "Red", parent_id: onion.id, is_sub_type: true, vegetable: true)
  Ingredient.find_or_create_by(name: "White", parent_id: onion.id, is_sub_type: true, vegetable: true)

  Ingredient.find_or_create_by(name: "Cheese", dairy: true)
  Ingredient.find_or_create_by(name: "Rice Noodles", grain: true)

  puts "ingredients seeded"
end
