# frozen_string_literal: true

Given 'the Accession is opened in edit mode' do
  visit "#{STAFF_URL}/accessions"

  fill_in 'filter-text', with: @uuid

  within '.search-filter' do
    find('button').click
  end

  search_result_rows = all('#tabledSearchResults tbody tr')
  expect(search_result_rows.length).to eq 1

  within search_result_rows[0] do
    element = find('a', text: 'Edit')

    @accession_id = URI.decode_www_form_component(element[:href]).split('/').pop
  end

  click_on 'Edit'
end

Given 'the New Event page is open for an Accession' do
  click_on 'Add Event'

  within '#form_add_event' do
    click_on 'Add Event'
  end
end

When 'the user links an Agent' do
  select 'Authorizer', from: 'event_linked_agents__0__role_'
  fill_in 'token-input-event_linked_agents__0__ref_', with: 'test_agent'
  dropdown_items = all('li.token-input-dropdown-item2')
  dropdown_items.first.click
end

Then 'the New Event page is displayed with the Accession linked' do
  expect(find('h2').text).to eq 'New Event Event'
  expect(find('#event_linked_records__0__ref__combobox')).to have_text @uuid
end
