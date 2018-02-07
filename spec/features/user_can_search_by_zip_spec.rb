require 'rails_helper'

feature "User can search by zip" do
  scenario "and view stations" do
    visit '/'

    fill_in 'q', with: '80203'

    click_on 'Locate'

    expect(current_path).to eq '/search'
    # with parameters visible in the url

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


    # expect(page).to have_content("7 Results")
    # # And I should see a message "7 Results"
    # expect(page).to have_css(".member", count: 7)
    # # And I should see a list of 7 the members of the house for Colorado

    # within(first(".member")) do
    #   expect(page).to have_css(".name")
    #   expect(page).to have_css(".role")
    #   expect(page).to have_css(".party")
    #   expect(page).to have_css(".district")
    # end