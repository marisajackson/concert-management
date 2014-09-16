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
    date 'none'
    venue 'none'
    promoter
  end
end