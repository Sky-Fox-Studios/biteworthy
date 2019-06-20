class Point < ActiveRecord::Base
  belongs_to :user

  #TODO polymorphic associations

  def self.save_for
    [Restaurant, Item, Food, Tag, Ingredient] # Review
  end
end
