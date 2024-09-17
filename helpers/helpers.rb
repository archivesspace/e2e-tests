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

def login_archivist
  uuid = SecureRandom.uuid

  login_admin

  visit "#{STAFF_URL}/users/new"

  fill_in 'user_username_', with: "archivist-user-#{uuid}"
  fill_in 'user_name_', with: "archivist-user-#{uuid}"
  fill_in 'user_password_', with: "archivist-user-#{uuid}"
  fill_in 'user_confirm_password_', with: "archivist-user-#{uuid}"

  find('#create_account').click

  expect(page).to have_text "User Created: archivist-user-#{uuid}"

  visit "#{STAFF_URL}/users/manage_access"

  find_user_element = find_user_table_row_in_manage_user_access_page("archivist-user-#{uuid}")

  within find_user_element do
    click_on 'Edit Groups'
  end

  check 'repository-archivists'

  click_on 'Update Account'

  expect(page).to have_text 'User Saved'

  visit "#{STAFF_URL}/logout"
  visit STAFF_URL

  fill_in 'username', with: "archivist-user-#{uuid}"
  fill_in 'password', with: "archivist-user-#{uuid}"

  click_on 'Sign In'
end

def ensure_test_repository_exists
  # Ensure the system has at least one repository

  element = find('.alert.alert-info.with-hide-alert')

  if element.text == 'To create your first Repository, click the System menu above and then Manage Repositories.'
    click_on 'System'
    click_on 'Manage Repositories'
    click_on 'Create Repository'

    fill_in 'repository_repository__repo_code_', with: 'repository_test'
    fill_in 'repository_repository__name_', with: 'Repository Test'
    find('#repository_repository__publish_').check
    click_on 'Save'

    expect(find('.alert.alert-success.with-hide-alert').text).to eq 'Repository Created'
    expect(find('.alert.alert-info.with-hide-alert').text).to eq 'Repository is Currently Selected'

    visit STAFF_URL
  end
rescue Capybara::ElementNotFound
  # Continue
end

def find_user_table_row_in_manage_user_access_page(username)
  loop do
    begin
      return find 'tr', text: username
    rescue Capybara::ElementNotFound
      # Pass to proceed to the next page.
    end

    begin
      find('a[title="Next"]').click
    rescue Capybara::ElementNotFound
      raise "User #{username} was not found in the manage user access page."
    end
  end
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

def click_on_string(string)
  click_on string
rescue Capybara::Ambiguous
  elements = all(:xpath, "//*[contains(text(), '#{string}')]")

  elements.first.click
end
