# As a visitor,
# When I visit '/merchants'
# I should see a list of merchants by name
# and when I click the merchant's name
# I should be on page '/merchants/:id'
# And I should see a list of items that merchant sells.

require 'rails_helper'

RSpec.describe 'merchants show page' do
  describe "When I visit '/merchants and click on a merchant name'" do
    it "shows a list of items the merchant sells" do
      VCR.use_cassette("merchant_list") do

        visit '/merchants'
        expect(page.status_code).to eq 200

        expect(page).to have_content('Merchants')
        expect(page).to have_link('Schroeder-Jerde')
      end

      VCR.use_cassette("merchant_show_page") do
        click_link 'Schroeder-Jerde'
        expect(current_path).to eq("/merchants/1")
        expect(page).to have_content('Schroeder-Jerde')
        expect(page).to have_content('Merchant Items:')
        expect(page).to have_link('Item Nemo Facere')
        expect(page).to have_link('Item Expedita Aliquam')
        expect(page).to have_link('Item Expedita Fuga')
        expect(page).to have_link('Item Est Consequuntur')
      end
    end
  end
end