# frozen_string_literal: true

Then 'the New Event page is displayed with the Digital Object linked' do
  expect(find('h2').text).to eq 'New Event Event'
  expect(find('#event_linked_records__0__ref__combobox')).to have_text @uuid
end

Given 'the New Event page is open for a Digital Object' do
  click_on 'Add Event'

  within '#form_add_event' do
    click_on 'Add Event'
  end
end
