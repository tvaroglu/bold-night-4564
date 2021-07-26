require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it {should have_many :ride_mechanics}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'class methods' do
    it 'it can return #average_experience of all mechanics' do
      mechanic_1 = Mechanic.create!(
        name: 'Tim Taylor',
        years_of_experience: 20
      )
      mechanic_2 = Mechanic.create!(
        name: 'Arthur Fonzarelli',
        years_of_experience: 30
      )

      expect(Mechanic.average_experience.to_i).to eq(25)
    end
  end

  describe 'instance methods' do
    it 'it can return #assigned_rides for a mechanic ordered by thrill rating' do
      mechanic = Mechanic.create!(
        name: 'Tim Taylor',
        years_of_experience: 20
      )
      mechanic.rides.create!(
        name: 'Tilt-a-whirl',
        thrill_rating: 40,
        open: true
      )
      mechanic.rides.create!(
        name: 'Lazy River',
        thrill_rating: 10,
        open: false
      )
      mechanic.rides.create!(
        name: 'The Executioner',
        thrill_rating: 100,
        open: true
      )

      expect(mechanic.assigned_rides.length).to eq(2)
      expect(mechanic.assigned_rides.first.name).to eq('The Executioner')
      expect(mechanic.assigned_rides.last.name).to eq('Tilt-a-whirl')

      expect(mechanic.assigned_ride_count).to eq(2)
    end
  end

end
