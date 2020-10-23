class AddIconToTag < ActiveRecord::Migration[4.2]
  def change
    add_attachment :tags, :icon
  end
end
