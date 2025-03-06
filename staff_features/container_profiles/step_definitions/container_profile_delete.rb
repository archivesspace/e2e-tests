# frozen_string_literal: true

When 'the user checks the checkbox of the Container Profile' do
  find('#multiselect-item').check
end

Then 'the Container Profile is deleted' do
  visit "#{STAFF_URL}/container_profiles/#{@container_profile_id}/edit"

  expect(find('h2').text).to eq 'Record Not Found'
  expected_text = "The record you've tried to access may no longer exist or you may not have permission to view it."
  expect(page).to have_text expected_text
end

Given 'the user is on the Container Profile view page' do
  visit "#{STAFF_URL}/container_profiles/#{@container_profile_id}"
end

Then 'the Container Profiles page is displayed' do
  expect(current_url).to include "#{STAFF_URL}/container_profiles"
end

Then 'the user is still on the Container Profile view page' do
  expect(current_url).to eq "#{STAFF_URL}/container_profiles/#{@container_profile_id}"
end

Given 'the user is on the Container Profile edit page' do
  visit "#{STAFF_URL}/container_profiles/#{@container_profile_id}/edit"
end
