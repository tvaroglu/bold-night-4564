require "rails_helper"

RSpec.describe Ride do
  describe 'relationships' do
    it {should have_many :ride_mechanics}
    it {should have_many(:mechanics).through(:ride_mechanics)}
  end

  describe 'class methods' do
    xit 'it does stuff' do
      # stuff
    end

    xit 'it does more stuff' do
      # stuff
    end
  end

end
