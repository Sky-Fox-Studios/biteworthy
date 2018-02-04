class AddTypeToTags < ActiveRecord::Migration
  def change
    add_column :tags, :type, :integer, after: :description
  end
end
