# frozen_string_literal: true

def search(uuid)
  visit STAFF_URL

  fill_in 'global-search-box', with: uuid
  find('#global-search-button').click
end

def login_admin
  visit STAFF_URL

  fill_in 'username', with: 'admin'
  fill_in 'password', with: 'admin'

  click_on 'Sign In'

  expect(page).to have_content 'Welcome to ArchivesSpace'
  expect(page).to have_content 'Your friendly archives management tool.'
  element = find('.global-header .user-container')
  expect(element.text.strip).to eq 'admin'
end

def create_resource(uuid)
  fill_in 'resource_title_', with: "Resource #{uuid}"
  fill_in 'resource_id_0_', with: "Resource #{uuid}"
  select 'Class', from: 'resource_level_'
  element = find('#resource_lang_materials__0__language_and_script__language_')
  element.send_keys('AU')
  element.send_keys(:tab)

  select 'Single', from: 'resource_dates__0__date_type_'
  fill_in 'resource_dates__0__begin_', with: '2024'

  fill_in 'resource_extents__0__number_', with: '10'
  select 'Cassettes', from: 'resource_extents__0__extent_type_'

  element = find('#resource_finding_aid_language_')
  element.send_keys('ENG')
  element.send_keys(:tab)

  element = find('#resource_finding_aid_script_')
  element.send_keys('Latin')
  element.send_keys(:tab)

  find('button', text: 'Save Resource', match: :first).click

  expect(page).to have_text "Resource Resource #{uuid} created"
end

def expect_record_to_be_in_search_results(search_term)
  fill_in 'global-search-box', with: search_term
  find('#global-search-button').click

  search_result_rows = all('#tabledSearchResults tbody tr')

  expect(search_result_rows.length).to eq 1
  expect(search_result_rows[0].text).to include search_term
end

def expect_record_to_not_be_in_search_results(search_term)
  fill_in 'global-search-box', with: search_term
  find('#global-search-button').click

  search_result_rows = all('#tabledSearchResults tbody tr')

  expect(search_result_rows.length).to eq 0
  expect(find('.alert.alert-info.with-hide-alert').text).to eq 'No records found'
end
