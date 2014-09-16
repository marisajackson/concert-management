# ## Promoter signs up with Facebook
# As a promoter, I want to be able to sign up for the website using my Facebook account.

# ###Usage:
# 1. On homepage, click "Promoter Sign Up"
# 2. Click "Sign Up With Facebook"
# 3. Promoter sees their profile page

# ###Acceptance Criteria
# * Promoter is prompted with Facebook Sign Up page
# * Promoter is saved to the database through the user model with:
#   * Name
#   * Email
#   * Photo Link

feature "Promoter Sign Up" do
  subject { page }
  before { visit root_path }

  scenario "with Facebook" do
    set_omniauth()
    click_on 'Sign Up As A Promoter'
    expect(page).to have_content('Promoter Sign Up')
    click_on 'Sign in with Facebook'
    expect(page).to have_content "Successfully authenticated from Facebook account."
    expect(current_path).to eq(promoter_dashboard_path)
    expect(page).to have_content "Sign Out"
    expect(page).to_not have_content "Promoter Sign In"
    click_link "Sign Out"
    expect(page).to_not have_content "Sign Out"
    expect(page).to have_content "Promoter Sign In"

    promoter = Promoter.last
    expect(promoter.email).to eq("foobar@example.com")
    expect(promoter.uid).to eq("1234")
    expect(promoter.name).to eq("MaRisa Jackson")
    expect(promoter.image).to eq("http://www.facebook.com/photo.jpg")
  end
  scenario "with Email" do
    click_link "Sign Up As A Promoter"
    fill_in "Email", with: "mhljackson@gmail.com"
    Capybara.exact = true
    fill_in "* Password", with: "password"
    fill_in "* Password confirmation", with: "password"
    Capybara.exact = false
    click_on "Sign up"
    expect(current_path).to eq(promoter_dashboard_path)
    expect(page).to have_content "Sign Out"
    expect(page).to_not have_content "Promoter Sign In"
    click_link "Sign Out"
    expect(page).to_not have_content "Sign Out"
    expect(page).to have_content "Promoter Sign In"

    promoter = Promoter.last
    expect(promoter.email).to eq("mhljackson@gmail.com")
  end

  scenario "Sign in with Email" do
    click_link "Sign Up As A Promoter"
    fill_in "Email", with: "mhljackson@gmail.com"
    Capybara.exact = true
    fill_in "* Password", with: "password"
    fill_in "* Password confirmation", with: "password"
    Capybara.exact = false
    click_on "Sign up"
    click_on "Sign Out"
    click_on "Promoter Sign In"
    fill_in "Email", with: "mhljackson@gmail.com"
    fill_in "Password", with: "password"
    click_on "Sign in"
    expect(current_path).to eq(promoter_dashboard_path)
    expect(page).to have_content "Sign Out"
  end
end