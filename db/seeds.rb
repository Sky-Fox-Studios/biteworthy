puts "loading seeds"
require File.expand_path('../seeds/dsp', __FILE__)
require File.expand_path('../seeds/himalayan', __FILE__)
require File.expand_path('../seeds/ninis', __FILE__)
require File.expand_path('../seeds/rgps', __FILE__)
require File.expand_path('../seeds/sizzling_siam', __FILE__)
require File.expand_path('../seeds/thai_kitchen', __FILE__)
require File.expand_path('../seeds/cream_bean_berry', __FILE__)



require File.expand_path('../seeds/tags', __FILE__)

if !User.exists?(:email => "skylar.bolton@gmail.com") then
   User.new(user_name: "Skylar", email: "skylar.bolton@gmail.com", password: "g00df00d", approved: true, is_admin: true).save
   puts "Users Seeded"
end
