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
    xit 'it does stuff' do
      # stuff
    end
  end

end
