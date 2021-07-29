require 'rails_helper'

RSpec.describe 'mechanics show' do
  # Story 2 - Mechanic Show Page
    # As a user,
    # When I visit a mechanic show page
    # I see their name, years of experience, and the names of all rides they’re working on
    # And I only see rides that are open
    # And the rides are listed by thrill rating in descending order (most thrills first)
  context 'no open rides assigned to a mechanic' do
    it "displays the mechanic's attributes and a notice that no rides have been assigned" do
      mechanic = Mechanic.create!(
        name: 'Tim Taylor',
        years_of_experience: 20
      )

      visit "/mechanics/#{mechanic.id}"
      # save_and_open_page

      expect(page).to have_content("Mechanic: #{mechanic.name}")
      expect(page).to have_content("Years of Experience: #{mechanic.years_of_experience}")
      expect(page).to have_content("No Rides Currently Assigned")
    end
  end

  context 'open rides currently assigned to a mechanic' do
    it "displays the mechanic's attributes and currently assigned rides ordered by thrill rating" do
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

      visit "/mechanics/#{mechanic.id}"
      # save_and_open_page

      expect(page).to have_content("Mechanic: #{mechanic.name}")
      expect(page).to have_content("Years of Experience: #{mechanic.years_of_experience}")
      expect(page).to have_content("All Rides Currently Assigned:")
      expect("#{mechanic.rides.last.name}").to appear_before("#{mechanic.rides.first.name}")
      expect(page).to_not have_content("Lazy River")

      within "#ride-#{mechanic.rides.first.id}" do
        expect(page).to have_content("Name: #{mechanic.rides.first.name}")
        expect(page).to have_content("Open: Yes")
        expect(page).to have_content("Thrill Level: #{mechanic.rides.first.thrill_rating}")
      end

      within "#ride-#{mechanic.rides.last.id}" do
        expect(page).to have_content("Name: #{mechanic.rides.last.name}")
        expect(page).to have_content("Open: Yes")
        expect(page).to have_content("Thrill Level: #{mechanic.rides.last.thrill_rating}")
      end
    end

  end

end
