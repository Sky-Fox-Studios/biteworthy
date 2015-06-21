module Dsp
  dsp              = Restaurant.find_or_create_by(name: "DSP", slogan: "New York style pizza")

  dsp_single_slice = MenuGroup.find_or_create_by(restaurant_id: dsp.id, name: "Single Slice", description: "Basic cheese pizza with...")

  cheese_slice = Item.find_or_create_by(restaurant_id: dsp.id, menu_group_id: dsp_single_slice.id, name: "Cheese", description: "Cheese Traditional")

  
  cheese = Food.find_or_create_by(restaurant_id: dsp.id, name: "Cheese")
  cheese_slice.foods << cheese


  puts "Dsp seeded"
end
