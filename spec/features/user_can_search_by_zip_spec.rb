require 'rails_helper'

feature "User can search by zip" do
  scenario "and view stations" do
    visit '/'

    fill_in 'q', with: '80203'

    click_on 'Locate'

    expect(path).to be '/search'
    # with parameters visible in the url

    stations = JSON.parse(response.body)

    station = stations.first

    expect(stations.count).to eq 10
    # within 6 miles sorted by distance

    expect(station).to have_key "Name"
    expect(station).to have_key "Address"
    expect(station).to have_key "Fuel Types"
    expect(station).to have_key "Distance"
    expect(station).to have_key "Access Times"

    # And the stations should be limited to Electric and Propane
  end
end