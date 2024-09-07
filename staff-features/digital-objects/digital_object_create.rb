# frozen_string_literal: true

Given('the user is on the New Digital Object page') do
  @uuid = SecureRandom.uuid

  visit "#{STAFF_URL}/digital_objects/new"
end

When('the user fills in Title with a unique id') do
  fill_in 'Title', with: "Digital Object Title #{@uuid}"
end

Then('the Digital Object created success message is displayed') do
  expect(find('.alert.alert-success.with-hide-alert').text).to match /^Digital Object.*Created$/
end

Then ('the digital object is not created') do
  expect(find('h2').text).to eq 'New Digital Object Digital Object'

  expect_record_to_not_be_in_search_results(@uuid)
end
