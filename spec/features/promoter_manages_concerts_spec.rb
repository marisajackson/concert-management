# ##Promoter adds concert - basic
# As a promoter, I want to add a concert with minimal information.

# ###Usage:
# 1. On dashboard, Promoter clicks "Add Concert"
# 2. Promoter enters Headliner, Date, and Venue.
# 3. Promoter clicks "Add Concert".

# ###Acceptance Criteria:
# * Promoter has "Add Concert" button on dashboard.
# * Clicking "Add Concert" displays form within dashboard.
# * Confirmation message and new concert is displayed on dashboard.

feature "managing concerts", js: true do
  before do
    promoter = FactoryGirl.create(:promoter)
    venue = FactoryGirl.create(:venue, promoter: promoter)
    login_as(promoter, :scope => :promoter)
    visit root_path
  end

  scenario "adding a concert - with basic info" do
    within('#concerts') do
      click_on "Add"
    end
    within("#concerts-container") do
      expect(page).to have_content("Add Concert")
      fill_in "Headliner", with: "Foxy Shazam"
      select "2015", from: "concert_date_1i"
      select "March", from: "concert_date_2i"
      select "28", from: "concert_date_3i"
      select "Emerson Theater", from: "concert_venue_id"
      click_on "Add Concert"
      expect(page).to_not have_content("Add Concert")
      expect(page).to have_content("Foxy Shazam")
    end
    expect(page).to have_content("Foxy Shazam concert has been added.")

    concert = Concert.last
    promoter = Promoter.last
    expect(concert.headliner).to eq("Foxy Shazam")
    expect(concert.venue.name).to eq("Emerson Theater")
    expect(concert.promoter).to eq(promoter)
    expect(promoter.concerts.count).to eq(1)
  end
end
