class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :user_id
      t.integer :object_id
      t.string :object_class
      t.integer :change_type
      t.integer :worth

      t.timestamps null: false
    end
  end
end
