class CreateUsersRoles < ActiveRecord::Migration
  def change
    create_table :users_roles do |t|
      t.string :user_id
      t.string :role_id
      t.timestamps
    end
  end
end
