class Price < ActiveRecord::Base
  belongs_to :priced, polymorphic: true

  validates :value, presence: true

  after_create -> { save_points('create') }
  after_update -> { save_points('update') }
  after_destroy -> { save_points('destroy') }

  def to_s
    number_with_precision(price, strip_insignificant_zeros: true);
  end

  def self.worth(change_type)
    case(change_type)
    when "create"
      3
    when "update"
      1
    when "destroy"
      -3
    end
  end
end
