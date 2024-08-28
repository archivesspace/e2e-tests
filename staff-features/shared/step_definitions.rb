# frozen_string_literal: true

Given 'the user is logged in as admin' do
  visit STAFF_URL

  fill_in 'username', with: 'admin'
  fill_in 'password', with: 'admin'

  click_on 'Sign In'

  expect(page).to have_content 'Welcome to ArchivesSpace'
  expect(page).to have_content 'Your friendly archives management tool.'
  element = find('.global-header .user-container')
  expect(element.text.strip).to eq 'admin'
end

Given 'I am logged in as an admin' do
  visit "#{STAFF_URL}/logout"
  visit STAFF_URL

  fill_in 'username', with: 'admin'
  fill_in 'password', with: 'admin'

  click_on 'Sign In'

  expect(page).to have_content 'Welcome to ArchivesSpace'
  expect(page).to have_content 'Your friendly archives management tool.'
  element = find('.global-header .user-container')
  expect(element.text.strip).to eq 'admin'
end

Given 'I am signed in as a view-only user' do
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

When 'I click on {string}' do |string|
  click_on string
rescue Capybara::Ambiguous
  elements = all(:xpath, "//*[contains(text(), '#{string}')]")

  elements.first.click
end

Then 'the message {string} is displayed' do |string|
  expect(page).to have_text string
end
