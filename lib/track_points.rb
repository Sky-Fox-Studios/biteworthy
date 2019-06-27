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
                 change_type: change_type,
                 worth: worth(change_type),
                 object_changes: self.changes.except(:created_at, :updated_at).to_json)

  end

  def save_for
    ["Restaurant", "Address", "Menu", "Item", "Price", "Extra", "Food", "Tag", "Ingredient", "Variety"] # Review
  end

  def worth(change_type)
    base_value = case self.class.to_s
      when "Restaurant",
        50
      when "Address",
        20
      when "Menu",
        15
      when "Item",
        15
      when "Price",
        10
      when "Food",
        10
      when "Extra",
        5
      when "Tag",
        5
      when "Ingredient",
        5
      when "Variety"
        5
      else
        1
      end
    case change_type
    when "create"
      base_value * 2
    when "update"
      (base_value / 5.0).ceil
    when "destroy"
      base_value * -1
    else
      base_value
    end
  end
end
