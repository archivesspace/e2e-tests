# frozen_string_literal: true

Given 'the Accession appears in the search results list' do
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
end

Given 'the Accession is opened in the view mode' do
  visit "#{STAFF_URL}/accessions"

  fill_in 'filter-text', with: @uuid

  within '.search-filter' do
    find('button').click
  end

  search_result_rows = all('#tabledSearchResults tbody tr')
  expect(search_result_rows.length).to eq 1

  within search_result_rows[0] do
    element = find('a', text: 'View')

    @accession_id = URI.decode_www_form_component(element[:href]).split('/').pop
  end

  click_on 'View'
end

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

When 'the user changes the {string} field to {string}' do |field, value|
  fill_in field, with: value
end

When 'the user changes the {string} field' do |field|
  fill_in field, with: "Updated Title #{SecureRandom.uuid}"
end

Then 'the {string} field has the original value' do |field|
  expect(page).to have_field(field, with: "Accession Title #{@uuid}")
end

Then 'the Accession is updated with the new {string} as {string}' do |field, value|
  fill_in field, with: value
end

Then 'the Accession is opened in the edit mode' do
  uri = current_url.split('/')
  uri.pop
  accession_id = uri.pop

  expect(accession_id).to eq @accession_id
end

Then 'all fields become editable' do
  fill_in 'Identifier', with: 'Identifier'
end

Then 'the field {string} has value {string}' do |field, value|
  expect(page).to have_field(field, with: value)
end

Then 'the Accession Date field has the original value' do
  visit "#{STAFF_URL}/accessions/#{@accession_id}/edit"

  expect(page).to have_field('Accession Date', with: '2000-01-01')
end

When 'the Identifier field has the original value' do
  visit "#{STAFF_URL}/accessions/#{@accession_id}/edit"

  expect(page).to have_field('Identifier', with: "Accession #{@uuid}")
end

Given 'the Accession is opened in edit mode by User A' do
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

Given 'the Accession is opened in edit mode by User B' do
  @session = Capybara::Session.new(:firefox_alternative_session)

  @session.visit(STAFF_URL)

  @session.fill_in 'username', with: 'test'
  @session.fill_in 'password', with: 'test'
  @session.click_on 'Sign In'
  expect(@session).to have_text 'Welcome to ArchivesSpace'

  @session.click_on 'Browse'
  @session.click_on 'Accessions'

  @session.fill_in 'filter-text', with: @uuid

  @session.find('.search-filter button').click

  @session.click_on 'Edit'
end

When 'User A clicks on {string}' do |string|
  click_on string
end

When 'User A changes the {string} field' do |field|
  fill_in field, with: "Accession Title #{@uuid} updated"
end

When 'User B changes the {string} field' do |field|
  @session.fill_in field, with: "Accession Title #{@uuid} updated"
end

When 'User B clicks on {string}' do |string|
  @session.click_on string
end

Then 'User B sees a conflict message which indicates that User A is editing this record' do
  tries = 6
  element = nil

  loop do
    break if tries == 0

    begin
      tries -= 1

      element = @session.find('#form_messages .alert.alert-warning.update-monitor-error')
      expect(element.text).to eq 'This record is currently being edited by another user. Please contact the following users to ensure no conflicts occur: admin'
      break
    rescue Capybara::ElementNotFound
      sleep 3
    end
  end
end

Then 'User B sees the following conflict message' do |messages|
  messages.raw.each do |message|
    expect(@session).to have_text message[0]
  end
end
