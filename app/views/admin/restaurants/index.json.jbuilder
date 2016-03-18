json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :slogan, :food_groups, :latitude, :longitude
  json.url restaurant_url(restaurant, format: :json)
end
