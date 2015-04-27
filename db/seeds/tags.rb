module TagSeeds
   sea    = Tag.find_or_create_by(name: "sea")
   land   = Tag.find_or_create_by(name: "land")
   air    = Tag.find_or_create_by(name: "air")
   plant  = Tag.find_or_create_by(name: "plant")
   animal = Tag.find_or_create_by(name: "animal")
   puts "tags seeded"
end
