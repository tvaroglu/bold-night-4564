require 'rails_helper'

RSpec.describe 'mechanics index' do
  # Story 1 - Mechanic Index Page
    # As a user,
    # When I visit the mechanics index page
    # I see a header saying “All Mechanics”
    # And I see a list of all mechanic’s names and their years of experience
    # And I see the average years of experience across all mechanics
  it 'displays all the mechanics and their attributes' do
    mechanic_1 = Mechanic.create!(
      name: 'Tim Taylor',
      years_of_experience: 20
    )
    mechanic_2 = Mechanic.create!(
      name: 'Arthur Fonzarelli',
      years_of_experience: 30
    )

    visit '/mechanics'
    # save_and_open_page

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content("Average Years of Experience: #{Mechanic.average_experience}")

    within "#mechanic-#{mechanic_1.id}" do
      expect(page).to have_content("Name: #{mechanic_1.name}")
      expect(page).to have_content("Years of Experience: #{mechanic_1.years_of_experience}")
    end

    within "#mechanic-#{mechanic_2.id}" do
      expect(page).to have_content("Name: #{mechanic_2.name}")
      expect(page).to have_content("Years of Experience: #{mechanic_2.years_of_experience}")
    end
  end

  it 'displays a link to the mechanic show page' do
    mechanic = Mechanic.create!(
      name: 'Tim Taylor',
      years_of_experience: 20
    )

    visit '/mechanics'
    # save_and_open_page

    within "#mechanic-#{mechanic.id}" do
      expect(page).to have_content("Name: #{mechanic.name}")
      click_on("#{mechanic.name}")
      expect(current_path).to eq("/mechanics/#{mechanic.id}")
    end
  end

end
