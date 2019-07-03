module TrackPoints
  extend ActiveSupport::Concern

  included do
    after_create -> { save_points('create_object') }
    after_update -> { save_points('update_object') }
    after_destroy -> { save_points('destroy_object') }
  end

  def save_points(change_type)
    if save_for.include? self.class.to_s
      # TODO add other checks here
      create_point(change_type)
    end
  end

  def create_point(change_type)
    Point.create(user_id: User.current.id,
                 object_id: self.id,
                 object_class: self.class.to_s,
                 change_type: Point.change_types[change_type],
                 worth: worth(change_type),
                 object_changes: self.changes.except(:created_at, :updated_at).to_json)

  end

  def save_for
    ["Restaurant", "Item", "Food", "Ingredient", "Address", "Menu", "MenuGroup", "Price", "Tag", "Extra", "Variety", "Hour", "Photo"]
  end

  def worth(change_type)
    base_value = case self.class.to_s
      when "Restaurant"
        100
      when "Item"
        30
      when "Food"
        25
      when "Ingredient"
        20
      when "Address", "Menu", "MenuGroup",  "Price"
        15
      when "Tag", "Photo"
        10
      when "Extra", "Variety", "Hour"
        5
      else
        1
      end
    case change_type
    when "create_object"
      base_value * 2
    when "update_object"
      (base_value / 5.0).ceil
    when "destroy_object"
      base_value * -1
    else
      base_value
    end
  end
end
