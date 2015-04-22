module Ninis
   ninis         = Restaurant.find_or_create_by(name: "Ninis", slogan: "Food so good you wont trust the water")
   ninis_burrito = MenuGroup.find_or_create_by(restaurant_id: ninis.id, name: "Burritos", description: "Small or large burrito filled wrapped and ready to eat")
   Food.find_or_create_by(restaurant_id: ninis.id, menu_group_id: ninis_burrito.id, name: "Chicken", 
      description: "Chicken, beans, rice, sour cream, cheese, and salsa", 
      price_low: 7.5, price_high: 8.75)
   Food.find_or_create_by(restaurant_id: ninis.id, menu_group_id: ninis_burrito.id, 
      name: "Barbacoa", 
      description: "Shredded beef, beans, rice, sour cream, cheese, and salsa", 
      price_low: 7.5, price_high: 8.75)
   Food.find_or_create_by(restaurant_id: ninis.id, menu_group_id: ninis_burrito.id, 
      name: "Carnitas", 
      description: "Shredded pork, beans, rice, sour cream, cheese, and salsa", 
      price_low: 7.5, price_high: 8.75)
   Food.find_or_create_by(restaurant_id: ninis.id, menu_group_id: ninis_burrito.id, 
      name: "Fish", 
      description: "Fish, spicy coleslaw, beans, rice, sour cream, cheese, and salsa", 
      price_low: 7.75, price_high: 8.95)
   Food.find_or_create_by(restaurant_id: ninis.id, menu_group_id: ninis_burrito.id, 
      name: "Vegetarian", 
      description: "Mixed sauteed vegetables, beans, rice, sour cream, cheese, and salsa", 
      price_low: 7.75, price_high: 8.95)
   
   
   
   puts "Ninis seeded"

end
