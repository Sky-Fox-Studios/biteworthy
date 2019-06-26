class Point < ActiveRecord::Base
  belongs_to :user

  enum change_types: [:create_object, :update_object, :delete_object]
  #TODO polymorphic associations

  def self.save_for
    ["Restaurant", "Address", "Menu", "Item", "Price", "Extra", "Food", "Tag", "Ingredient", "Variety"] # Review
  end
end
