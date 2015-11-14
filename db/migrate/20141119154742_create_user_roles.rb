class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.string :key
      t.string :name
      t.timestamps
    end
    add_index :user_roles, [:key], unique: true
  end
end
