require "rails_helper"

RSpec.describe Ride do
  describe 'relationships' do
    it {should have_many :ride_mechanics}
    it {should have_many(:mechanics).through(:ride_mechanics)}
  end

  describe 'class methods' do
    it 'it can order all #open_rides_by_thrill_rating' do
      ride_1 = Ride.create!(
        name: 'Tilt-a-whirl',
        thrill_rating: 40,
        open: true
      )
      ride_2 = Ride.create!(
        name: 'Lazy River',
        thrill_rating: 10,
        open: false
      )
      ride_3 = Ride.create!(
        name: 'The Executioner',
        thrill_rating: 100,
        open: true
      )

      expected = Ride.open_rides_by_thrill_rating

      expect(expected.length).to eq(2)
      expect(expected.first.name).to eq(ride_3.name)
      expect(expected.last.name).to eq(ride_1.name)
    end
  end

end
