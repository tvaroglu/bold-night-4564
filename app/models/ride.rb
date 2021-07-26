class Ride < ApplicationRecord
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.open_rides_by_thrill_rating
    where(open: true)
    .order(thrill_rating: :desc)
  end

end
