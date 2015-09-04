class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city, default: "Durango"
      t.string :state, default: "CO"
      t.integer :zip, default: 81301
      t.float  :latitude,  :limit => 12
      t.float  :longitude, :limit => 12
    end
  end
end
