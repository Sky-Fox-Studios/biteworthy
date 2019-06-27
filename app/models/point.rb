class Point < ActiveRecord::Base
  belongs_to :user

  enum change_types: [:create_object, :update_object, :destroy_object]
  #TODO polymorphic associations
  belongs_to :object, polymorphic: true

  def display_change_type
    case change_type
    when 0
      "Create"
    when 1
      "Update"
    when 2
      "Destroy"
    else
      "42"
    end
  end
end
