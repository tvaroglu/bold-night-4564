require 'rails_helper'

RSpec.describe 'application' do
  it 'displays a link to the mechanics index' do
    visit '/'
    # save_and_open_page

    expect(page).to have_content("B2 Mid Mod Assessment")
    expect(page).to have_link("Mechanics")

    click_link("Mechanics")
    expect(page).to have_current_path('/mechanics')
  end

  it 'displays a link to the application root' do
    visit '/mechanics'
    # save_and_open_page

    click_link("Home")
    expect(page).to have_current_path('/')
  end

end
