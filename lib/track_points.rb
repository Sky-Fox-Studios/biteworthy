module TrackPoints

  # Add the following to the model
  # after_create -> { save_points('create') }
  # after_update -> { save_points('update') }
  # after_destroy -> { save_points('destroy') }

  def save_points(change_type)
    if Point.save_for.include? self.class.to_s
      # TODO add other checks here
      create_point(change_type, self.class.worth(change_type))
    end
  end

  def create_point(change_type, worth)
    Point.create(user_id: User.current.id,
                 object_id: self.id,
                 object_class: self.class.to_s,
                 change_type: change_type + "_object",
                 worth: worth,
                 object_changes: self.changes.except(:created_at, :updated_at).to_json)

  end
end
