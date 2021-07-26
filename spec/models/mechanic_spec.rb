require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it {should have_many :ride_mechanics}
    it {should have_many(:rides).through(:ride_mechanics)}
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
