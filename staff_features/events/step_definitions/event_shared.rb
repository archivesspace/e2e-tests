# frozen_string_literal: true

Given 'the user is on the Event view page' do
  visit "#{STAFF_URL}/events/#{@event_id}"
end

Then 'the Events page is displayed' do
  expect(current_url).to include "#{STAFF_URL}/events"
end

Then 'the Event is deleted' do
  visit "#{STAFF_URL}/events/#{@event_id}/edit"

  expect(find('h2').text).to eq 'Record Not Found'

  expected_text = "The record you've tried to access may no longer exist or you may not have permission to view it."
  expect(page).to have_text expected_text
end

Then 'the user is still on the Event view page' do
  expect(current_url).to eq "#{STAFF_URL}/events/#{@event_id}"
end

Given 'the user is on the Event edit page' do
  expect(current_url).to eq "#{STAFF_URL}/events/#{@event_id}/edit"
end

Given 'the Event edit page is displayed' do
  visit "#{STAFF_URL}/events/#{@event_id}/edit"
end
