# frozen_string_literal: true

Given 'the Resource is opened in edit mode' do
  visit "#{STAFF_URL}/resources/#{@resource_id}/edit"
  wait_for_ajax
end

Then 'the New Event page is displayed with the Resource linked' do
  expect(find('h2').text).to eq 'New Event Event'
  expect(find('#event_linked_records__0__ref__combobox')).to have_text @uuid
end
