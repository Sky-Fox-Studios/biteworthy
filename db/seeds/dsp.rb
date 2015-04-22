module Dsp
   dsp              = Restaurant.find_or_create_by(name: "DSP", slogan: "New York style pizza")
   
   dsp_single_slice = MenuGroup.find_or_create_by(restaurant_id: dsp.id, name: "Single Slice", description: "Basic cheese Pizza with...")

   Food.find_or_create_by(restaurant_id: dsp.id, menu_group_id: dsp_single_slice.id, name: "Cheese", description: "Cheese Traditional", price_low: 3)

   
   
   
   puts "Dsp seeded"
end
