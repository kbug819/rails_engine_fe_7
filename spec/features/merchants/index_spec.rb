# As a visitor,
# When I visit '/merchants'
# I should see a list of merchants by name
# and when I click the merchant's name
# I should be on page '/merchants/:id'
# And I should see a list of items that merchant sells.

require 'rails_helper'

RSpec.describe 'merchants index page' do
  describe "When I visit '/merchants'" do
    it "shows a list of merchants by name" do
      VCR.use_cassette("merchant_list") do

        visit '/merchants'
        expect(page.status_code).to eq 200

        expect(page).to have_content('Merchants')
        expect(page).to have_link('Wisozk, Hoeger and Bosco')
        expect(page).to have_link('Fahey-Stiedemann')
        expect(page).to have_link('Glover Inc')
        expect(page).to have_link('Schroeder-Jerde')
        expect(page).to have_link('Klein, Rempel and Jones')
        expect(page).to have_link('Willms and Sons')
      end
    end
  end
end