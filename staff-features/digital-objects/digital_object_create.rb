# frozen_string_literal: true

Given('I am on the New Digital Object page') do
  @uuid = SecureRandom.uuid

  visit "#{STAFF_URL}/digital_objects/new"
end

When('I fill in Title with a unique id') do
  fill_in 'Title', with: "Digital Object Title #{@uuid}"
end

When('I fill in Identifier with a unique id') do
  fill_in 'Identifier', with: @uuid
end

Then('the digital object is created') do
  expect(find('h2').text).to eq "Digital Object Title #{@uuid} Digital Object"
  expect(find('.alert.alert-success.with-hide-alert').text).to eq "Digital Object Digital Object Title #{@uuid} Created"

  expect_record_to_be_in_search_results(@uuid)
end

Then ('the digital object is not created') do
  expect(find('h2').text).to eq 'New Digital Object Digital Object'

  expect_record_to_not_be_in_search_results(@uuid)
end
