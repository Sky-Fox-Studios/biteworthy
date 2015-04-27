json.array!(@food_items) do |food_item|
  json.extract! food_item, :id, :restaurant_menu_group_id, :name, :description, :price
  json.url food_item_url(food_item, format: :json)
end
