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

describe "Promoter Sign Up" do
  subject { page }
  before { visit root_path }

  describe "as Promoter" do
    describe "with Facebook" do
      it "should sign in/up Promoter" do
        set_omniauth()
        click_link_or_button 'Sign Up As A Promoter'
        expect(page).to have_content('Promoter Sign Up')
        click_link_or_button 'Sign in with Facebook'
        expect(page).to have_content "Successfully authenticated from Facebook account."
        expect(current_path).to eq(promoter_dashboard_path)
        expect(page).to have_content "Sign out"
        expect(page).to_not have_content "Promoter Sign In"
        click_link "Sign out"
        expect(page).to_not have_content "Sign out"
        expect(page).to have_content "Promoter Sign In"

        promoter = Promoter.last
        expect(promoter.email).to eq("foobar@example.com")
        expect(promoter.uid).to eq("1234")
        expect(promoter.name).to eq("MaRisa Jackson")
        expect(promoter.image).to eq("http://www.facebook.com/photo.jpg")
      end
    end
    describe "with Email" do
      it "should sign up Promoter" do
        click_link "Sign Up As A Promoter"
        fill_in "Email", with: "mhljackson@gmail.com"
        Capybara.exact = true
        fill_in "* Password", with: "password"
        fill_in "* Password confirmation", with: "password"
        Capybara.exact = false
        click_link_or_button "Sign up"
        expect(current_path).to eq(promoter_dashboard_path)
        expect(page).to have_content "Sign out"
        expect(page).to_not have_content "Promoter Sign In"
        click_link "Sign out"
        expect(page).to_not have_content "Sign out"
        expect(page).to have_content "Promoter Sign In"

        promoter = Promoter.last
        expect(promoter.email).to eq("mhljackson@gmail.com")
      end

      it "should be able to sign in" do
        click_link "Sign Up As A Promoter"
        fill_in "Email", with: "mhljackson@gmail.com"
        Capybara.exact = true
        fill_in "* Password", with: "password"
        fill_in "* Password confirmation", with: "password"
        Capybara.exact = false
        click_link_or_button "Sign up"
        click_link_or_button "Sign out"
        click_link_or_button "Promoter Sign In"
        fill_in "Email", with: "mhljackson@gmail.com"
        fill_in "Password", with: "password"
        click_link_or_button "Sign in"
        expect(current_path).to eq(promoter_dashboard_path)
        expect(page).to have_content "Sign out"
      end 
    end
  end
end