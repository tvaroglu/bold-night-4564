class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.average_experience
    average(:years_of_experience)
  end

  def assigned_rides
    rides.where(open: true)
    .order(thrill_rating: :desc)
  end

  def assigned_ride_count
    assigned_rides.count
  end

end
