# ##Employee signs up with Email
# As an employee, I want to sign up by following the email instructions. (with Email)

# ###Usage:
# 1. In email, click link to sign up.
# 2. On employee sign up confirmation page, employee enters promoter's code and confirms promoters name/company.
# 3. Employee enters email, password, password confirmation, and optionally adds a photo(link).
# 4. Employee sees their dashboard.

# ###Acceptance Criteria:
# * Employee sees sign up confirmation page
# * Employee enters correct code for promoter
# * Employee enters valid input for email sign up
# * Employee is saved in database through the employee model:
#   * Name
#   * Email
#   * Image(link)
#   * Belonging to the promoter
# * Employee sees confirmation 

feature "Employee Sign Up", js: true do

  background do
    clear_emails
    promoter = FactoryGirl.create(:promoter)
    login_as(promoter, :scope => :promoter)
    visit root_path
    within('#employees') do
      click_on "Add"
    end
    fill_in "Email", with: "employee@example.com"
    click_on "Add Employee"
    expect(page).to have_content("An invitation email has been sent to employee@example.com.")
    click_on "Sign Out"
    open_email('employee@example.com')
  end

  scenario "should receive custom sign up email" do
    pending "implementation"
    expect(current_email).to have_content("Hello")
    expect(current_email).to have_content("MaRisa Jackson has requested that you sign up for RunShow.")
  end

  scenario "should sign up using email" do
    current_email.click_link 'Accept Invitation'
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Set my password"
    promoter = Promoter.last
    expect(promoter.employees.count).to eq(1)
    expect(Employee.last.promoter.name).to eq("MaRisa Jackson")
    expect(Employee.last.email).to eq("employee@example.com")
  end
end






















