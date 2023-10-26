# As a visitor,
# When I visit '/items'
# I should see a list of items by name
# and when I click the item's name
# I should be on page '/items/:id'
# And I should see the name of the item, description, and unit price.
require 'rails_helper'

RSpec.describe 'item show page' do
  describe "When I visit '/merchants/:id, I see a list of merchant items'" do
    describe "if I click on an item'" do
      it "takes me to an item show page to show me the details of that item" do
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
          expect(page).to have_content('Items:')
          expect(page).to have_link('Item Nemo Facere')
          expect(page).to have_link('Item Expedita Aliquam')
          expect(page).to have_link('Item Expedita Fuga')
          expect(page).to have_link('Item Est Consequuntur')
        end

        VCR.use_cassette("item_show_page") do
          click_link 'Item Nemo Facere'
          expect(current_path).to eq("/items/4")
          expect(page).to have_content('Item Name: Item Nemo Facere')
          expect(page).to have_content('Description: Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.')
          expect(page).to have_content('Unit Price: $42.91')
        end
      end
    end
  end
end