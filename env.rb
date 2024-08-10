require 'capybara/cucumber'
require 'selenium-webdriver'

BASE_URL = 'https://e2e.archivesspace.org'
PUBLIC_URL = BASE_URL
STAFF_URL = "#{BASE_URL}/staff"

Capybara.register_driver :firefox do |app|
  options = Selenium::WebDriver::Firefox::Options.new

  Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
end

Capybara.default_driver = :firefox
Capybara.default_max_wait_time = 10
