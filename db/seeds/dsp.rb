module Dsp
  dsp              = Restaurant.find_or_create_by(name: "DSP", slogan: "New York style pizza",
  main_image_url: "dsp.png")
  default_menu         = dsp.menus.create

  dsp_single_slice = MenuGroup.find_or_create_by(restaurant_id: dsp.id, name: "Single Slice", description: "Basic pizza with...")
  dsp_single_slice.menus << default_menu

  cheese_slice = Item.find_or_create_by(restaurant_id: dsp.id, name: "Cheese", description: "Traditional slice of cheese pizza")
  cheese_slice.menu_groups << dsp_single_slice

  toppings = "Pepperoni, Italian Sausage, Canadian Bacon, Chicken, Anchovies, Green Peppers, Peperoncini, Jalepeños, Geeen Chillies, Onions, Roasted Onions, Green Olives, Black Olives, Feta, Blue Cheese, Extra Cheese, Spinish, Fresh Basil, Sundried tomatoes, Roma Tomatoes, Mushrooms, Garlic, Artichoke hearts, Pineapple"

  topping_choices = []
  toppings.split(', ').each do |topping|
    topping_choices << Food.find_or_create_by(name: topping, restaurant: dsp)
  end

  toppings_choice = Choice.find_or_create_by(name: "Toppings", restaurant: dsp)
  toppings_choice.foods = topping_choices

  # cheese = Food.find_or_create_by(restaurant_id: dsp.id, name: "Cheese")
  # cheese_slice.foods << cheese

  puts "Dsp seeded"
end
