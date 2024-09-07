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

Then 'the {string} message is displayed' do |string|
  expect(page).to have_text string
end

Then 'the following error messages are displayed:' do |messages|
  messages.raw.each do |message|
    expect(page).to have_text message[0]
  end
end
