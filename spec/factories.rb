FactoryGirl.define do
  factory :promoter do
    email 'marisa@marisa.com'
    password 'password'
    name 'MaRisa Jackson'
    company 'Plus One Productions'
  end

  factory :venue do
    name 'Emerson Theater'
    street_address '12 Emerson Way'
    city 'Indianapolis'
    state 'IN'
    zip_code '46260'
    contact_name 'Dave Hess'
    contact_number '(317) 555-8242'
    promoter
  end

  factory :concert do
    headliner 'Foxy Shazam'
    date Date.today
    venue 'none'
    promoter 'none'
    employee nil
  end

  factory :expense_category do
    name 'Talent'
    promoter
  end

  factory :income_category do
    name 'Tickets'
    promoter
  end
end