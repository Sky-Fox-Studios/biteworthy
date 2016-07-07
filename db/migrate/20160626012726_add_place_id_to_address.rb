class AddPlaceIdToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :place_id, :string
  end
end
