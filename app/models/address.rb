class Address < ActiveRecord::Base
  belongs_to :restaurant

  after_create -> { save_points('create') }
  after_update -> { save_points('update') }
  after_destroy -> { save_points('destroy') }

  def self.worth(change_type)
    case(change_type)
    when "create"
      4
    when "update"
      1
    when "destroy"
      -4
    end
  end
end
