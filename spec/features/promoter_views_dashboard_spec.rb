# ##Promoter views dashboard
# As a promoter, I want to view my dashboard with all relevant informoation.

# ###Usage:
# 1. Click "Dashboard" from any page

# ###Accepatance Criteria:
# * Promoter sees the following sections:
#   * Upcoming concerts
#     * Today's Concerts are highlighted
#   * Employees
#   * Venues
#   * Stats
#   * Promoter Info (photo, company name)

feature "promoter views dashboard", js: true do

  before do
    promoter = FactoryGirl.create(:promoter)
    login_as(promoter, :scope => :promoter)
    visit root_path
  end

  scenario "should see general info" do
    expect(page).to have_content("Plus One Productions")
    expect(page).to have_content("Sign Out")
  end

  scenario "should see upcoming concerts - concerts saved for this week and next" do
    venue = FactoryGirl.create(:venue, promoter: Promoter.last)
    FactoryGirl.create(:concert, date: Date.today, venue: venue, promoter: Promoter.last)
    FactoryGirl.create(:concert, headliner: "Tub Ring", date: Date.new(2015,2,3), venue: venue, promoter: Promoter.last)
    visit root_path

    within('#this-weeks-concerts') do
      expect(page).to have_content("09/16/2014")
      expect(page).to have_content("Foxy Shazam")
      expect(page).to have_content("Emerson Theater")
      expect(page).not_to have_content("Tub Ring")
    end
  end

  scenario "should see message for no upcoming concerts" do
    venue = FactoryGirl.create(:venue, promoter: Promoter.last, promoter: Promoter.last)
    FactoryGirl.create(:concert, headliner: "Tub Ring", date: Date.new(2015,2,3), venue: venue, promoter: Promoter.last)

    visit root_path

    within('#this-weeks-concerts') do
      expect(page).to have_content("There are currently no concerts this week.")
      expect(page).not_to have_content("Tub Ring")
    end
  end

  scenario "should see all concerts" do
    venue = FactoryGirl.create(:venue, promoter: Promoter.last)
    FactoryGirl.create(:concert, date: Date.today, venue: venue, promoter: Promoter.last)
    FactoryGirl.create(:concert, headliner: "Tub Ring", date: Date.new(2015,2,3), venue: venue, promoter: Promoter.last)

    visit root_path

    within('#concerts-container') do
      expect(page).to have_content("02/03/2015")
      expect(page).to have_content("Tub Ring")
      expect(page).to have_content("Emerson Theater")
    end
  end
end