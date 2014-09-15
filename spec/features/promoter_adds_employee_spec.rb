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
  end

  scenario "adding an employee" do
    pending "How to test invitable"
    within('#employees') do
      click_on "Add"
    end

    within("#employees-container") do
      expect(page).to have_content("Add Employee")
      fill_in
    end
  end

end