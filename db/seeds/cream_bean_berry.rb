module CreamBeanBerry
   cbb          = Restaurant.find_or_create_by(name: "Cream Bean Berry", slogan: "Eat Good. Feel Good.",
    about: "Our ice cream is made from scratch with 100% percent organic milk, crea, and sugar. We user as many local ingredients as possible. We reduce our waste through recycling and biodegradable packaging.",
    main_image_url: "cbb.png")

    cbb_ice_cream = MenuGroup.find_or_create_by(restaurant_id: cbb.id, name: "Ice Cream Servings", description: "")
   cbb_ice_cream_items = [
     ["Mini Scoop", [{price:2.75, size: nil}, {price: 2.25, size: "with cone"}, {price: 3.75, size: "with waffle cone"}]],
     ["Single Scoop", [{price: 3.50, size: nil}, {price: 4.00, size: "with cone"}, {price: 4.50, size: "with waffle cone"}]],
     ["Double Scoop", [{price: 6.00, size: nil}, {price: 6.50, size: "with cone"}, {price: 7.00, size: "with waffle cone"}]],
     ["Pint", [{price: 8.00, size: nil}]],
     ["Quart", [{price: 14.00, size: nil}]],
     ["'Growler'", [{price: 12.00, size: "5$ jar deposit"}, {price: 7.00, size: "Refills"}]],
   ]
   cbb_ice_cream_items.each do |name, prices_sizes|
     item = Item.find_or_create_by(restaurant: cbb, menu_group: cbb_ice_cream,
      name: name)
      prices_sizes.each do |price_size|
        Price.find_or_create_by(value: price_size[:price], size: price_size[:size], priced_id: item.id, priced_type: "Item")
      end
   end

    cbb_drinks = MenuGroup.find_or_create_by(restaurant_id: cbb.id, name:
      "Drinks", description: nil)
    cbb_drinks_items = [
      ["Zuberfizz Float", "Two scoops of ice cream + Zufferfizz soda", [{price: 6.25}]],
      ["Milk Shake", "Your choice of ice cream",  [{price: 6.00}]],
      ["Malt", "Milk shake and malted milk powder",  [{price: 6.50}]],
      ["Frappé", "Cold-brew coffee(organinc)+ice cream, blended",  [{price: 6.50}]],
      ["Green tea Shake", "Match green tea + ice cream, blended", [{price: 6.50}]],
      ["Chai tea Shake", "Blue Lotus Chai + ice cream, blended", [{price: 6.50}]],
      ["Lemon Maté Shake", "Yerba Maté, lemon oil, ice cream, blended", [{price: 6.50}, {price: 3.25}]],
      ["Sorbet Fizz", "Sorbet + Fever Tree tonic water", [{price: 6.25}, {price: 3.25}]],
    ]

    cbb_drinks_items.each do |name, description, prices_sizes|
      item = Item.find_or_create_by(restaurant: cbb, menu_group: cbb_drinks,
       name: name,
       description: description)
      prices_sizes.each do |price_size|
        Price.find_or_create_by(value: price_size[:price], priced_id: item.id, priced_type: "Item")
      end
    end

    cbb_specialties = MenuGroup.find_or_create_by(restaurant_id: cbb.id, name:
      "Specialities", description: "")
    cbb_specialties_items = [
      ["Ice Cream Sandwich", "Hose baked cookies & ice cream", [{price: 4.50, size: nil}]],
      ["Ice Cream Pop", "Mini-scoop of ice cream, dipped in chocolate, garnished with topping", [{price: 2.50, size: nil}]],
      ["Ice Cream Cake", "Made to order (gluten-free, add $2)", [{price: 34.00, size: "small"},{price: 47.00, size: "large"}]],
      ["Ice Cream Pie", "Made to order", [{price: 25, size: nil}]],
    ]

    cbb_specialties_items.each do |name, description, prices_sizes|
      item = Item.find_or_create_by(restaurant: cbb, menu_group: cbb_specialties,
       name: name,
       description: description)
       prices_sizes.each do |price_size|
         Price.find_or_create_by(value: price_size[:price], size: price_size[:size], priced_id: item.id, priced_type: "Item")
       end
    end


  #  extras_menu_group = MenuGroup.find_or_create_by(restaurant_id: cbb.id, name: "Extras", description: nil)
   #
  #  extra_items = [
  #    ["Homemade guacamole", 1.25],
  #    ["Freshly made salsa",0.75],
  #    ["Freshly made 16oz salsa", 7.95],
  #    ["Spicy coleslaw", 1],
  #    ["Side of beans or rice", 1.5],
  #    ["Sour cream",0.5],
  #    ["Cheese", 1],
  #    ["Side of tortilla chips", 1.95],
  #  ]
   #
  #  extra_items.each do |name, price|
  #    item = Item.find_or_create_by(restaurant: cbb, menu_group: extras_menu_group,
  #     name: name)
  #     Price.find_or_create_by(price: price, item: item)
  #  end
   #
  #  bebidas_menu_group = MenuGroup.find_or_create_by(restaurant_id: cbb.id, name: "Bebidas", description: nil)
   #
  #

   puts "Cream Bean berry seeded"
end
