# frozen_string_literal: true

require 'byebug'
require 'capybara/cucumber'
require 'selenium-webdriver'

case ENV.fetch('HOST', nil)
when 'localhost', 'http://localhost:8080'
  BASE_URL = 'http://localhost:8080'
  PUBLIC_URL = 'http://localhost:8081'
  STAFF_URL = BASE_URL
else
  BASE_URL = 'https://e2e.archivesspace.org'
  PUBLIC_URL = BASE_URL.freeze
  STAFF_URL = "#{BASE_URL}/staff".freeze
end

case ENV.fetch('HEADLESS', nil)
when 'true'
  HEADLESS = '--headless'
else
  HEADLESS = ''
end

Capybara.register_driver :firefox do |app|
  options = Selenium::WebDriver::Firefox::Options.new
  options.add_argument(HEADLESS)

  Capybara::Selenium::Driver.new(app, browser: :firefox, options:)
end

Capybara.register_driver :firefox_alternative_session do |app|
  options = Selenium::WebDriver::Firefox::Options.new
  options.add_argument(HEADLESS)

  Capybara::Selenium::Driver.new(app, browser: :firefox, options:)
end

Capybara.default_driver = :firefox
Capybara.default_max_wait_time = 10

BeforeAll do
  connection_error = "\nNo server found running on #{STAFF_URL}.\n\n"

  begin
    response = Net::HTTP.get_response(URI(STAFF_URL))

    raise connection_error if response.code != '200'
  rescue Errno::ECONNREFUSED, Errno::ECONNRESET
    raise connection_error
  end
end
