# ##Promoter adds expenses to a concert
# As a promoter, I want to add expenses to a concert with an expense category.

# ###Usage:
# * First add category:
#   1. From dashboard, click Manage Finances.
#   2. On the finances page, click "Add Expense Category"
#   3. Enter the category name.
#   4. Click save.
# * Then add expense to specific concert:
#   1. From concert view page, click "Add" in expenses section.
#   2. Enter category, name, expected cost, and viewable by employee.
#   3. Click save.

# ###Acceptance Criteria:
# * Promoter has saved expense categories.
# * After clicking save, promoter sees expense category displayed.

feature "promoters adds expense category", js:true do
  before do
    @promoter = FactoryGirl.create(:promoter)
    @venue = FactoryGirl.create(:venue, promoter: @promoter)
    @concert = FactoryGirl.create(:concert, promoter: @promoter, venue: @venue)
    login_as(@promoter, :scope => :promoter)
    visit root_path
  end

  scenario "should display after entering valid information" do
    within("#stats") do
      click_on "Finances"
    end

    within("#expenses") do
      click_on "Add Expense Category"
      fill_in "Name", with: "Advertising"
      click_on "Save"
    end
    expect(page).to have_content("Advertising has been added to the Expense Categories.")
    expect(page).to have_content("Advertising")
    expect(ExpenseCategory.last.name).to eq("Advertising")
    expect(ExpenseCategory.last.promoter).to eq(@promoter)
  end
end

feature "promoter adds expense to specific concert", js: true do
  before do
    @promoter = FactoryGirl.create(:promoter)
    @venue = FactoryGirl.create(:venue, promoter: @promoter)
    @concert = FactoryGirl.create(:concert, promoter: @promoter, venue: @venue)
    @expense_category = FactoryGirl.create(:expense_category, promoter: @promoter)
    login_as(@promoter, :scope => :promoter)
    visit root_path
  end
  scenario "should display after entering valid information - one expense" do
    visit concert_path(@concert)
    within("#concert-expenses") do
      click_on "Add"
      select "Talent", from: "expense_expense_category_id"
      fill_in "Name", with: "Headliner"
      fill_in "Expected cost", with: "2500"
      check "Viewable by employee"
      click_on "Save"
      expect(page).to have_content("Talent")
      # expect(page).to have_content("$2500")
      find('.accordion-navigation a').click
      expect(page).to have_content("Headliner")
    end
    expect(page).to have_content("Headliner has been added to the Talent Expense Category.")
    expect(Expense.last.concert).to eq(@concert)
    expect(Expense.last.expense_category).to eq(@expense_category)
    expect(Expense.last.name).to eq("Headliner")
  end
end

feature "promoters adds income category", js:true do
  before do
    @promoter = FactoryGirl.create(:promoter)
    @venue = FactoryGirl.create(:venue, promoter: @promoter)
    @concert = FactoryGirl.create(:concert, promoter: @promoter, venue: @venue)
    login_as(@promoter, :scope => :promoter)
    visit root_path
  end

  scenario "should display after entering valid information" do
    within("#stats") do
      click_on "Finances"
    end

    within("#incomes") do
      click_on "Add Income Category"
      fill_in "Name", with: "Tickets"
      click_on "Save"
    end
    expect(page).to have_content("Tickets has been added to the Income Categories.")
    expect(page).to have_content("Tickets")
    expect(IncomeCategory.last.name).to eq("Tickets")
    expect(IncomeCategory.last.promoter).to eq(@promoter)
  end
end

feature "promoter adds expense to specific concert", js: true do
  before do
    @promoter = FactoryGirl.create(:promoter)
    @venue = FactoryGirl.create(:venue, promoter: @promoter)
    @concert = FactoryGirl.create(:concert, promoter: @promoter, venue: @venue)
    @income_category = FactoryGirl.create(:income_category, promoter: @promoter)
    login_as(@promoter, :scope => :promoter)
    visit root_path
  end
  scenario "should display after entering valid information - one income" do
    visit concert_path(@concert)
    within("#concert-incomes") do
      click_on "Add"
      select "Tickets", from: "income_income_category_id"
      fill_in "Name", with: "Advance"
      fill_in "Expected revenue", with: "2500"
      check "Viewable by employee"
      click_on "Save"
      expect(page).to have_content("Tickets")
      # expect(page).to have_content("$2500")
      find('.accordion-navigation a').click
      expect(page).to have_content("Advance")
    end
    expect(page).to have_content("Advance has been added to the Tickets Income Category.")
    expect(Income.last.concert).to eq(@concert)
    expect(Income.last.income_category).to eq(@income_category)
    expect(Income.last.name).to eq("Advance")
  end
end