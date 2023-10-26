# As a visitor,
# When I visit '/'
# I should see a search bar to search through all merchants by name fragment
# and when I submit 
# I should see a list of merchants with that name'

require 'rails_helper'

RSpec.describe 'merchants index page' do
  describe "When I visit '/merchants'" do
    it "shows a list of merchants by name" do
      visit '/'
      expect(page).to have_content("Search by Merchant Name")
      expect(page).to have_button("Search")
      
      fill_in :name, with: "Group"
      
      VCR.use_cassette("merchant_search") do
        click_button "Search"
        expect(page).to have_link("Daugherty Group")
        expect(page).to have_link("Dibbert Group")
        expect(page).to have_link("Gibson Group")
        expect(page).to have_link("Heaney Group")
        expect(page).to have_link("Jewess Group")
        expect(page).to have_link("Kiehn Group")
        expect(page).to have_link("Kozey Group")
        expect(page).to have_link("Marvin Group")
        expect(page).to have_link("Parisian Group")
      end
    end
  end
end