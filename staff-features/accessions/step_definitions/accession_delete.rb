# frozen_string_literal: true

Given 'the user is on the accession details page' do
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

When 'the user clicks on the checkbox of the accession' do
  table_row = find('tr', text: @uuid, match: :first)

  within table_row do
    check 'multiselect-item'
  end
end

When 'the user confirms the delete action' do
  within '#confirmChangesModal' do
    click_on 'Delete'
  end
end

Then 'the accession is deleted' do
  expect_record_to_not_be_in_search_results(@uuid)
end

Then 'the accession is not deleted' do
  expect_record_to_be_in_search_results(@uuid)
end
