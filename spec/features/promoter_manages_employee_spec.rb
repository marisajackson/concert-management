# ##Promoter adds employees
# As a promoter, I want to be able to add/invite employees by entering their email.

# ###Usage:
# 1. On dashboard, click "Add Employee"
# 2. Promoter enters employee's email and clicks add
# 3. Promoter sees success message on dashboard

# ###Acceptance Criteria:
# * Promoter sees add employee form within dashboard
# * Promoter enters valid employee email and clicks add
# * An email is sent to the employee
# * Promoter sees a confirmation message

feature "adding employees", js:true do
  before do
    promoter = FactoryGirl.create(:promoter)
    login_as(promoter, :scope => :promoter)
    visit root_path
  end

  scenario "adding an employee" do
    within('#employees') do
      click_on "Add"
    end

    within("#employees-container") do
      expect(page).to have_content("Add Employee")
      fill_in "Email", with: "employee@example.com"
      click_on "Add Employee"
      expect(page).to_not have_content("Add Employee")
      expect(page).to have_content("employee@example.com")
    end

    expect(Employee.last.email).to eq("employee@example.com")
    expect(Employee.last.invitation_token).to be_present
    expect(page).to have_content("An invitation email has been sent to employee@example.com.")
  end
end

feature "assign employee to show", js:true do
  before do
    @promoter = FactoryGirl.create(:promoter)
    @venue = FactoryGirl.create(:venue, promoter: @promoter)
    @concert = FactoryGirl.create(:concert, promoter: @promoter, venue: @venue) 
    login_as(@promoter, :scope => :promoter)
    visit root_path
    within('#employees') do
      click_on "Add"
      fill_in "Email", with: "employee@example.com"
      click_on "Add Employee"
    end
    visit root_path
  end

  scenario "should successfully assign employee" do
    within('.concert-item') do
      find('.assign').click
    end
    select "employee@example.com", from: "concert_employee_id"
    click_on "Assign Employee"
    expect(page).to have_content("employee@example.com")
    expect(page).to have_content("The Foxy Shazam concert has been updated.")
    expect(Concert.last.employee.email).to eq("employee@example.com")
  end


end
