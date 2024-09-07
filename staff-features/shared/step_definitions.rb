# frozen_string_literal: true

Given 'the user is logged in as an administrator' do
  login_admin
end

Given 'the user is logged in as a view-only user' do
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

  fill_in 'user_username_', with: "view-only-user-#{@uuid}"
  fill_in 'user_name_', with: "view-only-user-#{@uuid}"
  fill_in 'user_password_', with: "view-only-user-#{@uuid}"
  fill_in 'user_confirm_password_', with: "view-only-user-#{@uuid}"

  find('#create_account').click

  expect(page).to have_text "User Created: view-only-user-#{@uuid}"

  visit "#{STAFF_URL}/logout"
  visit STAFF_URL

  fill_in 'username', with: "view-only-user-#{@uuid}"
  fill_in 'password', with: "view-only-user-#{@uuid}"

  click_on 'Sign In'
end

When 'the user clicks on Delete' do
  click_on_string 'Delete'
end

When 'the user clicks on Cancel' do
  click_on_string 'Cancel'
end

When 'the user clicks on Delete Records' do
  click_on_string 'Delete Records'
end

When 'the user clicks on Browse' do
  click_on_string 'Browse'
end

When 'the user clicks on Accessions' do
  click_on_string 'Accessions'
end

When 'the user clicks on System' do
  click_on_string 'System'
end

When 'the user clicks on Manage Repositories' do
  click_on_string 'Manage Repositories'
end

When 'the user clicks on Create Repository' do
  click_on_string 'Create Repository'
end

When 'the user clicks on Save' do
  click_on_string 'Save'
end

When 'the user clicks on Save Resource' do
  click_on_string 'Save Resource'
end

When 'the user clicks on Revert Changes' do
  click_on_string 'Revert Changes'
end

When 'the user clicks on Create User' do
  click_on_string 'Create User'
end

When 'the user clicks on Create Account' do
  click_on_string 'Create Account'
end

When 'the user clicks on Title' do
  click_on_string 'Title'
end

When 'the user fills in {string} with {string}' do |label, value|
  fill_in label, with: value
end

When 'the user fills in {string} with {string}' do |label, value|
  fill_in label, with: value
end

When 'the user selects {string} from {string}' do |option, label|
  select option, from: label
end

Then 'the message {string} is displayed' do |string|
  expect(page).to have_text string
end

Then 'the following error messages are displayed:' do |messages|
  messages.raw.each do |message|
    expect(page).to have_text message[0]
  end
end
