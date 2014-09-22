 
feature "Employee view dashboard", js: true do

  background do
    sign_up_employee
    @employee = Employee.last
    visit root_path
    click_on "Employee Sign In"
    fill_in "Email", with: "employee@example.com"
    fill_in "Password", with: "password"
    click_on "Sign in"
    @promoter = Promoter.last
    @venue = FactoryGirl.create(:venue, promoter: @promoter)
  end

  scenario "should see all concerts" do
    FactoryGirl.create(:concert, date: Date.today, venue: @venue, promoter: @promoter, employee: @employee)
    FactoryGirl.create(:concert, headliner: "Motion City Soundtrack", date: Date.tomorrow, venue: @venue, promoter: @promoter, employee: @employee)
    FactoryGirl.create(:concert, headliner: "Jack White", date: Date.today, venue: @venue, promoter: @promoter)
    visit root_path
    within("#assigned-concerts") do
      expect(page).to have_content("Foxy Shazam")
      expect(page).to have_content("Motion City Soundtrack")
      expect(page).to_not have_content("Jack White")
    end

    within("#concerts") do
      expect(page).to have_content("Foxy Shazam")
      expect(page).to have_content("Motion City Soundtrack")
      expect(page).to have_content("Jack White")
    end
  end
end
