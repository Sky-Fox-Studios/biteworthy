class CreateItems < ActiveRecord::Migration[4.2]
  def change
    create_table :items do |t|
      t.integer :restaurant_id
      t.string  :name
      t.string  :description

      t.timestamps
    end
  end
end
