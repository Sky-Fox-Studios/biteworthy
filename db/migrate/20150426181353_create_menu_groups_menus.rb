class CreateMenuGroupsMenus < ActiveRecord::Migration[4.2]
  def change
    create_table :menu_groups_menus do |t|
      t.integer :menu_group_id, index: true
      t.integer :menu_id, index: true
    end
  end
end
