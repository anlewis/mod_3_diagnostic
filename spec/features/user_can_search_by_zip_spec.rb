require 'rails_helper'

feature "User can search by zip" do
  scenario "and view stations" do
    visit '/'

    fill_in 'q', with: '80203'

    VCR.use_cassette("features/user_can_search_by_zip") do
      click_on 'Locate'

      expect(current_path).to eq '/search'

      expect(page).to have_css(".station", count: 10)
      # within 6 miles sorted by distance

      within(first(".station")) do
        expect(page).to have_css(".name")
        expect(page).to have_css(".address")
        expect(page).to have_css(".fuel_type")
        expect(page).to have_css(".distance")
        expect(page).to have_css(".access")
      end
      # And the stations should be limited to Electric and Propane
    end
  end
end
