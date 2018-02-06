class AddVarietyToTags < ActiveRecord::Migration
  def change
    add_column :tags, :description, :integer, after: :name
    add_column :tags, :variety, :integer, after: :description
  end
end
