# frozen_string_literal: true

Given 'the user is on the Resource view page' do
  visit "#{STAFF_URL}/resources/#{@resource_id}"

  expect(current_url).to include "/resources/#{@resource_id}"
end

When 'the user checks the checkbox of the Resource' do
  page.refresh

  find('#multiselect-item').check
  row = find('tr.selected')
  input = row.find('input')
  expect(input.value).to include 'repositories'
  expect(input.value).to include 'resource'

  @resource_id = input.value.split('/').pop
end

Then 'the Resource is deleted' do
  expect(@resource_id).to_not eq nil

  visit "#{STAFF_URL}/resources/#{@resource_id}/edit"

  expect(find('h2').text).to eq 'Record Not Found'

  expected_text = "The record you've tried to access may no longer exist or you may not have permission to view it."
  expect(page).to have_text expected_text
end

Then 'the Resources page is displayed' do
  expect(find('h2').text).to have_text 'Resources'
end

Then 'the user is still on the Resource view page' do
  expect(current_url).to include "resources/#{@resource_id}"
end
