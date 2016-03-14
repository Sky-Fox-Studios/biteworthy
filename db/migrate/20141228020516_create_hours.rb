class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.time :opening
      t.time :closing
      t.integer :day
      t.integer :hour_id
      t.string :hour_type
      t.timestamps
    end
  end
end