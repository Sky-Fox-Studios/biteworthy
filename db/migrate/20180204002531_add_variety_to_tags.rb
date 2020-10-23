class AddVarietyToTags < ActiveRecord::Migration[4.2]
  def change
    add_column :tags, :variety, :integer, after: :description
  end
end
