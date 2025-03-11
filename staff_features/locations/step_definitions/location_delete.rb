# frozen_string_literal: true

Given 'a Location has been created' do
  visit "#{STAFF_URL}/locations/new"

  fill_in 'location_building_', with: "Location Building #{@uuid}"
  fill_in 'location_barcode_', with: @uuid

  find('button', text: 'Save Location', match: :first).click

  uri_parts = current_url.split('/')
  uri_parts.pop
  @location_id = uri_parts.pop
end

When 'the user filters by text with the Location building' do
  fill_in 'Filter by text', with: "Location Building #{@uuid}"

  find('#filter-text').send_keys(:enter)

  rows = []
  checks = 0

  while checks < 5
    checks += 1

    begin
      rows = all('tr', text: @uuid)
    rescue Selenium::WebDriver::Error::JavascriptError
      sleep 1
    end

    break if rows.length == 1
  end
end

When 'the user checks the checkbox of the Location' do
  find('#multiselect-item').check
end

Then 'the Location is deleted' do
  visit "#{STAFF_URL}/locations/#{@location_id}/edit"

  expect(find('h2').text).to eq 'Record Not Found'

  expected_text = "The record you've tried to access may no longer exist or you may not have permission to view it."
  expect(page).to have_text expected_text
end

Given 'the Location view page is displayed' do
  visit "#{STAFF_URL}/locations/#{@location_id}"
end

Then 'the user is still on the Location view page' do
  expect(current_url).to eq "#{STAFF_URL}/locations/#{@location_id}"
end

Then 'the Locations page is displayed' do
  expect(current_url).to include "#{STAFF_URL}/locations"
end
