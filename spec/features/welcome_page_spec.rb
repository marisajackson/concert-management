describe "welcome page" do
  subject { page }
  before { visit root_path }

  describe "user who is not signed in" do
    it { should have_content("Welcome") }
  end

end
