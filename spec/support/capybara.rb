require 'capybara/rspec'
require 'capybara/poltergeist'
require 'capybara/webkit'

Capybara.javascript_driver = :poltergeist
Capybara.configure do |config|
  config.match = :prefer_exact
end
