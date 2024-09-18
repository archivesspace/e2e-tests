# frozen_string_literal: true

Given 'the user is on the Accession view page' do
  visit "#{STAFF_URL}/accessions"

  fill_in 'filter-text', with: @uuid

  within '.search-filter' do
    find('button').click
  end

  table_row = find('tr', text: @uuid, match: :first)

  within table_row do
    click_on 'View'
  end
end

When 'the user filters by text with the Accession title' do
  fill_in 'Filter by text', with: @uuid

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

When 'the user checks the checkbox of the Accession' do
  find('#multiselect-item').check
end

When 'the user confirms the delete action' do
  within '#confirmChangesModal' do
    click_on 'Delete'
  end
end

Then 'the user is still on the Accession view page' do
  expect(find('h2').text).to eq "Accession #{@uuid} Accession"
end

Then 'the Accessions page is displayed' do
  expect(find('h2').text).to have_text 'Accessions'
end
