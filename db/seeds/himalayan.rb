module Himalayan
   himalayan = Restaurant.find_or_create_by(name: "Himalayan", slogan: "Mountain food for mountain people")
   puts "Himalayan seeded"

end