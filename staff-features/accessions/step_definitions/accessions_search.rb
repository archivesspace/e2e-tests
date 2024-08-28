# frozen_string_literal: true

Given 'an accession has been created' do
  @uuid = SecureRandom.uuid

  visit "#{STAFF_URL}/accessions/new"
  fill_in 'accession_id_0_', with: "Accession #{@uuid}"
  click_on 'Save'
end

When 'I search for the accession title' do
  fill_in 'filter-text', with: @uuid

  within '.search-filter' do
    find('button').click
  end
end

When 'the accession is in the search results' do
  visit "#{STAFF_URL}/accessions"

  fill_in 'filter-text', with: @uuid

  within '.search-filter' do
    find('button').click
  end
end

When 'I click on the View button' do
  table_row = find('tr', text: @uuid, match: :first)

  within table_row do
    click_on 'View'
  end
end

Then 'I can view the accession details page' do
  title = find('h2')

  expect(title.text).to eq "Accession #{@uuid} Accession"
end

Given 'two accessions have been created' do
  @shared_accession_uuid = SecureRandom.uuid
  @accession_a_uuid = SecureRandom.uuid
  @accession_b_uuid = SecureRandom.uuid

  visit "#{STAFF_URL}/accessions/new"
  fill_in 'accession_title_', with: "Accession A #{@accession_a_uuid} #{@shared_accession_uuid}"
  fill_in 'accession_id_0_', with: "Accession A #{@accession_a_uuid}"
  click_on 'Save'

  visit "#{STAFF_URL}/accessions/new"
  fill_in 'accession_title_', with: "Accession B #{@accession_b_uuid} #{@shared_accession_uuid}"
  fill_in 'accession_id_0_', with: "Accession B #{@accession_b_uuid}"
  click_on 'Save'

  visit "#{STAFF_URL}/accessions"

  fill_in 'filter-text', with: @shared_accession_uuid

  within '.search-filter' do
    find('button').click
  end
end

Given 'the accessions are on the search results sorted by ascending title' do
  search_result_rows = all('#tabledSearchResults tbody tr')

  expect(search_result_rows.length).to eq 2
  expect(search_result_rows[0]).to have_text @accession_a_uuid
  expect(search_result_rows[1]).to have_text @accession_b_uuid
end

Then 'the accessions are sorted by descending title' do
  search_result_rows = all('#tabledSearchResults tbody tr')

  expect(search_result_rows.length).to eq 2
  expect(search_result_rows[1]).to have_text @accession_a_uuid
  expect(search_result_rows[0]).to have_text @accession_b_uuid
end
