json.array!(@create_user_favorites) do |create_user_favorite|
  json.extract! create_user_favorite, :id, :is_liked, :metta_id, :type_id, :comment
  json.url create_user_favorite_url(create_user_favorite, format: :json)
end
