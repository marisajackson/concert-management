def sign_up_employee
  clear_emails
  promoter = FactoryGirl.create(:promoter)
  login_as(promoter, :scope => :promoter)
  visit root_path
  within('#employees') do
    click_on "Add"
  end
  fill_in "Email", with: "employee@example.com"
  fill_in "First name", with: "Mike"
  click_on "Add Employee"
  expect(page).to have_content("An invitation email has been sent to employee@example.com.")
  click_on "Sign Out"
  open_email('employee@example.com')
  current_email.click_link 'Accept Invitation'
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_on "Set my password"
end