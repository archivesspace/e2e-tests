# frozen_string_literal: true

Given 'an administrator user is logged in' do
  login_admin
end

Given 'an archivist user is logged in' do
  @uuid = SecureRandom.uuid

  visit "#{STAFF_URL}/logout"
  visit STAFF_URL

  fill_in 'username', with: 'admin'
  fill_in 'password', with: 'admin'

  click_on 'Sign In'

  expect(page).to have_content 'Welcome to ArchivesSpace'
  expect(page).to have_content 'Your friendly archives management tool.'
  element = find('.global-header .user-container')
  expect(element.text.strip).to eq 'admin'

  visit "#{STAFF_URL}/users/new"

  fill_in 'user_username_', with: "archivist-user-#{@uuid}"
  fill_in 'user_name_', with: "archivist-user-#{@uuid}"
  fill_in 'user_password_', with: "archivist-user-#{@uuid}"
  fill_in 'user_confirm_password_', with: "archivist-user-#{@uuid}"

  find('#create_account').click

  expect(page).to have_text "User Created: archivist-user-#{@uuid}"

  visit "#{STAFF_URL}/users/manage_access"

  find_user_element = find_user_table_row_in_manage_user_access_page("archivist-user-#{@uuid}")

  within find_user_element do
    click_on 'Edit Groups'
  end

  check 'repository-archivists'

  click_on 'Update Account'

  expect(page).to have_text 'User Saved'

  visit "#{STAFF_URL}/logout"
  visit STAFF_URL

  fill_in 'username', with: "archivist-user-#{@uuid}"
  fill_in 'password', with: "archivist-user-#{@uuid}"

  click_on 'Sign In'
end

When 'the user clicks on {string}' do |string|
  click_on_string string
end

When 'the user fills in Identifier' do
  fill_in 'Identifier', with: @uuid
end

When 'the user fills in {string} with {string}' do |label, value|
  fill_in label, with: value
end

When 'the user selects {string} from {string}' do |option, label|
  select option, from: label
end

When 'the user checks {string}' do |label|
  check label
end

Then 'the {string} message is displayed' do |string|
  expect(page).to have_text string
end

Then('the {string} created message is displayed') do |string|
  expect(find('.alert.alert-success.with-hide-alert').text).to match /^#{string}.*created$/i
end

Then('the {string} updated message is displayed') do |string|
  expect(find('.alert.alert-success.with-hide-alert').text).to match /^#{string}.*updated$/i
end

Then 'the following error messages are displayed:' do |messages|
  messages.raw.each do |message|
    expect(page).to have_text message[0]
  end
end

Then 'the {string} has value {string}' do |label, value|
  expect(page).to have_field(label, with: value)
end

Then 'the {string} has selected value {string}' do |label, value|
  expect(page).to have_select(label, selected: value)
end

Then 'the {string} is checked' do |label|
  expect(page).to have_field(label, checked: true)
end
