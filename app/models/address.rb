class Address < ApplicationRecord
  include TrackPoints
  belongs_to :restaurant
end
