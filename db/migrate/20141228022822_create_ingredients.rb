class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string  :name
      t.boolean  :meat
      t.boolean  :local
      t.boolean  :organic
      t.boolean  :naturally_grown
      t.boolean  :genetically_modified
      t.timestamps
    end
  end
end