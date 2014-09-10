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

describe "User Sign Up" do
  subject { page }
  before { visit root_path }

  describe "as Promoter" do
    describe "with Facebook" do
      it "should sign in/up user" do
        pending "implementation"
        click_link 'Sign Up As A Promoter'
        expect(page).to have_content('Promoter Sign Up')
        click_link 'Sign In With Facebook'
      end
    end
    describe "with Email" do
      it "should sign up user" do
        click_link "Sign Up As A Promoter"
        save_and_open_page
        fill_in "Email", with: "mhljackson@gmail.com"
        Capybara.exact = true
        fill_in "* Password", with: "password"
        fill_in "* Password confirmation", with: "password"
        click_button "Sign up"
      end
    end
  end
end