# ##Promoter adds venue
# As a promoter, I want to add a venue.

# ###Usage:
# 1. On dashboard, promoter clicks add venue.
# 2. Promoter enters venue name, address, and contact information.
# 3. Promoter clicks "Add Venue"

# ###Acceptance Criteria:
# * Promoter has "Add Venue" button on dashboard. 
# * Clicking "Add Venue" displays form within dashboard.
# * Confirmation message and new venue is displayed on dashboard.

feature "Promoter Venue Management", js: true do
  before do
    promoter = FactoryGirl.create(:promoter)
    login_as(promoter, :scope => :promoter)
    visit root_path
  end

  scenario "adding venue" do
    within('#venues') do
      click_link_or_button "Add"
    end
    within('#venues-container') do
      expect(page).to have_content("Add Venue")
      fill_in "Name", with: "Emerson Theater"
      fill_in "Street address", with: "12 Emerson Way"
      fill_in "City", with: "Indianapolis"
      fill_in "State", with: "IN"
      fill_in "Zip code", with: "46260"
      fill_in "Contact name", with: "Dave Hess"
      fill_in "Contact number", with: "(317) 555-8242"
      click_link_or_button "Add Venue"
      expect(page).to_not have_content("Add Venue")
      expect(page).to have_content("Emerson Theater")
    end
    expect(page).to have_content("Emerson Theater has been added.")
  end
end
