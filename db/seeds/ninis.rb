module Ninis
   ninis          = Restaurant.find_or_create_by(name: "Ninis", slogan: "Food so good you wont trust the water")
   ninis_burritos = MenuGroup.find_or_create_by(restaurant_id: ninis.id, name: "Burritos", description: "A flour tortilla with beans, rice, sour crea, cheese, salsa, and...")
   burrito_items = [
     ["Chicken", nil, [{price: 7.50, size: "small"},{price: 8.75, size: "regular"}]],
     ["Barbacoa", "Shredded beef", [{price: 7.50, size: "small"},{price: 8.75, size: "regular"}]],
     ["Carnitas", "Shredded pork", [{price: 7.50, size: "small"},{price: 8.75, size: "regular"}]],
     ["Fish", "Alaskan pollock with spicy coleslaw", [{price: 7.75, size: "small"},{price: 8.95, size: "regular"}]],
     ["Vegetarian", "Mixed sauteed vegetables", [{price: 7.50, size: "small"},{price: 8.75, size: "regular"}]],
     ["Beans, rice, & salsa", "Beans, rice, sour cream, cheese, and salsa", [{price: 6.25, size: "small"},{price: 7.25, size: "regular"}]],
   ]
   burrito_items.each do |name, description, prices_sizes|
     item = Item.find_or_create_by(restaurant: ninis, menu_group: ninis_burritos,
      name: name,
      description: description)
      prices_sizes.each do |price_size| 
        Price.find_or_create_by(price: price_size[:price], size: price_size[:size], item: item)
      end
   end

    ninis_tacos = MenuGroup.find_or_create_by(restaurant_id: ninis.id, name:
      "Tacos", description: "Three soft flour or corn tortillas filled with sour cream, cheese, lettuce, salsa and...")
    taco_items = [
      ["Chicken", nil, [{price: 8.25, size: nil}]],
      ["Carnitas", "Shredded pork",  [{price: 8.25, size: nil}]],
      ["Barbacoa", "Shredded beef",  [{price: 8.25, size: nil}]],
      ["Fish", "Alaskan Pollock with spicy coleslaw",  [{price: 8.50, size: nil}]],
      ["Vegetarian", "Mixed sauteed vegetables", [{price: 8.25, size: nil}]],
      ["Individual Taco", "Filled with choice ingredients.", [{price: 2.95, size: "each"}, {price: 3.25, size: "for fish"}]],
    ]

    taco_items.each do |name, description, prices_sizes|
      item = Item.find_or_create_by(restaurant: ninis, menu_group: ninis_tacos,
       name: name,
       description: description)
      prices_sizes.each do |price_size|
        Price.find_or_create_by(price: price_size[:price], size: price_size[:size], item: item)
      end
    end

    ninis_quesadillas = MenuGroup.find_or_create_by(restaurant_id: ninis.id, name:
      "Quesadillas", description: "grilled flour torilla with melted chees, sour cream, salsa and...")
    quesadillas_items = [
      ["Chicken", nil, [{price: 7.50, size: "small"},{price: 8.50, size: "regular"}]],
      ["Carnitas", "Shredded pork", [{price: 7.50, size: "small"},{price: 8.50, size: "regular"}]],
      ["Barbacoa", "Shredded beef", [{price: 7.50, size: "small"},{price: 8.50, size: "regular"}]],
      ["Fish", "Alaskan Pollock with spicy coleslaw", [{price: 8.75, size: "small"},{price: 8.75, size: "regular"}]],
      ["Vegetarian", "Mixed sauteed vegetables", [{price: 7.50, size: "small"},{price: 8.50, size: "regular"}]],
      ["Just cheese", nil, [{price: 5.50, size: "small"},{price: 6.50, size: "regular"}]],
    ]

    quesadillas_items.each do |name, description, prices_sizes|
      item = Item.find_or_create_by(restaurant: ninis, menu_group: ninis_quesadillas,
       name: name,
       description: description)
       prices_sizes.each do |price_size|
         Price.find_or_create_by(price: price_size[:price], size: price_size[:size], item: item)
       end
    end

    mild_salsa_menu_group = MenuGroup.find_or_create_by(restaurant_id: ninis.id, name: "Mild salsa", description: nil)
    medium_salsa_menu_group = MenuGroup.find_or_create_by(restaurant_id: ninis.id, name: "Medium salsa", description: nil)
    hot_salsa_menu_group = MenuGroup.find_or_create_by(restaurant_id: ninis.id, name: "Hot Salsa", description: nil)

   salsa_items = [
     ["Corn & Black Beans", "Mixture of corn blackbeans, tomatoes, lime, scallions, salt and pepper.", mild_salsa_menu_group],
     ["Mango Lime", "Blended mangos, limes ,red onions and jalapenos.", mild_salsa_menu_group],
     ["Salsa Del Sol", "Chunky tomato salsa with roasted green peppers, red onions, lime juice, cilantro, and salt - Salsa of the sun.", mild_salsa_menu_group],
     ["Tomatillo", "Blended tomatillos, jalapenos, bumin, onions - a salsa verde", medium_salsa_menu_group],
     ["Pico De Gallo", " A chucky tomato salsa wih jalapenos, cilantro, onions, lime and salt; means 'beak of the roaster'", medium_salsa_menu_group],
     ["Roasted Roma Tomato", "Oven roasted roma tomatoes, onions, and jalapenos", medium_salsa_menu_group],
     ["Roasted Serrano", "Serrano chillies, tomatoes, oions, peppers, cilantro, cumin, salt, pepper, and vinagers", hot_salsa_menu_group],
     ["Chipotle Puree", "Blended adobo chillies with various spices, very smokey", hot_salsa_menu_group],
     ["Mango Habanero", "Freshly chopped mango, onions, habanero peppers, red peppers", hot_salsa_menu_group],
   ]

   salsa_items.each do |name, description, menu_group|
     item = Item.find_or_create_by(restaurant: ninis, menu_group: menu_group,
      name: name,
      description: description)
   end

   soup_and_salad_menu_group = MenuGroup.find_or_create_by(restaurant_id: ninis.id, name: "Salad, Soups & Other Stuff", description: nil)

   soup_and_salad_items = [
     ["Southwestern Fish Chowder", "variation of the original with southwestern flavours, served with tortilla or chips", 5.50, soup_and_salad_menu_group],
     ["Tortilla Salad", "Shreadded lettuce, vinegarette dressing, chips, cheese, sour cream, & choice of 2 salsas. Add meat, rice, beans, fish or veggies for $1.50 each.", 5.95, soup_and_salad_menu_group],
     ["Nachos", "tortilla chips with melted cheese, sour cream and salsa. Add meat, rice beans, fish or veggies for $1.50 each.", 7.50, soup_and_salad_menu_group],
   ]

   soup_and_salad_items.each do |name, description, price, menu_group|
     item = Item.find_or_create_by(restaurant: ninis, menu_group: menu_group,
      name: name,
      description: description)
      Price.find_or_create_by(price: price, item: item)
   end

   for_the_kids_menu_group = MenuGroup.find_or_create_by(restaurant_id: ninis.id, name: "For The Kids", description: nil)

   for_the_kids_items = [
     ["El Raton", "kid size quesadilla", 3.50, for_the_kids_menu_group],
     ["El Bicho", "kid size quesadilla with chicken, pork, or beef.", 3.95, for_the_kids_menu_group],
   ]

   for_the_kids_items.each do |name, description, price, menu_group|
     item = Item.find_or_create_by(restaurant: ninis, menu_group: menu_group,
      name: name,
      description: description)
      Price.find_or_create_by(price: price, item: item)
   end

   extras_menu_group = MenuGroup.find_or_create_by(restaurant_id: ninis.id, name: "Extras", description: nil)

   extra_items = [
     ["Homemade guacamole", 1.25],
     ["Freshly made salsa",0.75],
     ["Freshly made 16oz salsa", 7.95],
     ["Spicy coleslaw", 1],
     ["Side of beans or rice", 1.5],
     ["Sour cream",0.5],
     ["Cheese", 1],
     ["Side of tortilla chips", 1.95],
   ]

   extra_items.each do |name, price|
     item = Item.find_or_create_by(restaurant: ninis, menu_group: extras_menu_group,
      name: name)
      Price.find_or_create_by(price: price, item: item)
   end

   bebidas_menu_group = MenuGroup.find_or_create_by(restaurant_id: ninis.id, name: "Bebidas", description: nil)

   bebidas_items = [
     "Sodas",
     "Beer",
     "Margaritas"
   ]

   bebidas_items.each do |name|
     item = Item.find_or_create_by(restaurant: ninis, menu_group: bebidas_menu_group,
      name: name)
   end

   puts "Ninis seeded"
end
