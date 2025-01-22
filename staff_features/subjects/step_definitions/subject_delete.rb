# frozen_string_literal: true

When 'the user checks the checkbox of the Subject' do
  find('#multiselect-item').check
  row = find('tr.selected')
  input = row.find('input')
  expect(input.value).to include 'subjects'

  @subject_id = input.value.split('/').pop
end

Then 'the Subject is deleted' do
  expect(@subject_id).to_not eq nil

  visit "#{STAFF_URL}/subjects/#{@subject_id}/edit"

  expect(find('h2').text).to eq 'Record Not Found'

  expected_text = "The record you've tried to access may no longer exist or you may not have permission to view it."
  expect(page).to have_text expected_text
end

Given('the user is on the Subject view page') do
  visit "#{STAFF_URL}/subjects/#{@subject_id}"
end

Then 'the user is still on the Subject view page' do
  expect(find('h2').text).to eq "subject_term_#{@uuid} Subject"
end

Then 'the Subjects page is displayed' do
  expect(find('h2').text).to have_text 'Subjects'
end
