class AddTagsToExtras < ActiveRecord::Migration[4.2]
  def change
    create_table :extras_tags do |t|
      t.integer :extra_id
      t.integer :tag_id
    end
  end
end
