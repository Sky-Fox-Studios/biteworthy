class ChangeMenuGroupDescriptionToText < ActiveRecord::Migration[4.2]
  def change
    change_column :menu_groups, :description, :text
  end
end
