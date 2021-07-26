require "rails_helper"

RSpec.describe RideMechanic do
  describe 'relationships' do
    it {should belong_to :ride}
    it {should belong_to :mechanic}
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
