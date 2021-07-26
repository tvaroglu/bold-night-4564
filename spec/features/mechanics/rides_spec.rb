require 'rails_helper'

RSpec.describe 'add rides to mechanic show' do
  # Story 3 - Add a Ride to a Mechanic
    # As a user,
    # When I go to a mechanics show page
    # I see a form to add a ride to their workload
    # When I fill in that field with an id of an existing ride and hit submit
    # I’m taken back to that mechanic's show page
    # And I see the name of that newly added ride on this mechanics show page
  it 'displays a form to search for a ride by id to assign to a mechanic' do
    mechanic = Mechanic.create!(
      name: 'Tim Taylor',
      years_of_experience: 20
    )
    ride = Ride.create!(
      name: 'Tilt-a-whirl',
      thrill_rating: 40,
      open: true
    )

    visit "/mechanics/#{mechanic.id}"
    # save_and_open_page

    expect(page).to have_content("No Rides Currently Assigned")
    expect(page).to_not have_content("#{ride.name}")
    expect(page).to_not have_content("Search Results:")

    expect(page).to have_content("Add Rides to Mechanic:")
    fill_in 'Ride Id', with: "#{ride.id}"
    click_on("Search Rides")
    expect(page).to have_content("Search Results:")

    within "#ride-#{ride.id}" do
      expect(page).to have_content("Name: #{ride.name}")
      expect(page).to have_content("Open: Yes")
      expect(page).to have_content("Thrill Level: #{ride.thrill_rating}")
      click_on("Add #{ride.name}")
      expect(current_path).to eq("/mechanics/#{mechanic.id}")
    end

    visit "/mechanics/#{mechanic.id}"
    # save_and_open_page

    expect(page).to have_content("All Rides Currently Assigned:")
    expect(page).to have_content("#{ride.name}")
    expect(page).to_not have_content("Search Results:")
  end

end
