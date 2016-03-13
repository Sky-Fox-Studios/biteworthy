puts "loading seeds"
if !User.exists?(:email => "skylar.bolton@gmail.com") then
  @skylar = User.new(user_name: "Skylar", email: "skylar.bolton@gmail.com", password: "gr3@tf00d", approved: true, is_admin: true).save
end
if !User.exists?(:email => "mccormick.carina@gmail.com") then
  @carina = User.new(user_name: "Skylar", email: "mccormick.carina@gmail.com", password: "Catfood1!", approved: true, is_admin: true).save
end
if !User.exists?(:email => "editor@bwd.com") then
  @skylar = User.new(user_name: "Editor", email: "editor@bwd.com", password: "g00df00d", approved: true, is_editor: true).save
end
puts "Sky, Carina and editor users seeded"
puts "q flag"
# require File.expand_path('../seeds/0_ingredients', __FILE__)
require File.expand_path('../seeds/rgps',             __FILE__)
require File.expand_path('../seeds/himalayan',        __FILE__)
require File.expand_path('../seeds/thai_kitchen',     __FILE__)
require File.expand_path('../seeds/ninis',            __FILE__)
require File.expand_path('../seeds/cream_bean_berry', __FILE__)
require File.expand_path('../seeds/sizzling_siam',    __FILE__)
require File.expand_path('../seeds/dsp',              __FILE__)

# require File.expand_path('../seeds/tags', __FILE__)

puts "Wahoo! You are ready to go."

