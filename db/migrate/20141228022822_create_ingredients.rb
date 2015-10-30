class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string  :name
      t.boolean  :fruit, default: false
      t.boolean  :herb, default: false
      t.boolean  :grain, default: false
      t.boolean  :nut, default: false
      t.boolean  :bean_legume_pulse, default: false
      t.boolean  :vegetable, default: false
      
      t.boolean  :animal_product, default: false
      t.boolean  :dairy, default: false
      
      t.boolean  :meat, default: false
      
      t.boolean  :poultry, default: false
      
      t.boolean  :fish, default: false
      t.timestamps
    end
  end
end
