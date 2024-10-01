# frozen_string_literal: true

Before do
  @uuid = SecureRandom.uuid
end

Given 'an administrator user is logged in' do
  login_admin

  ensure_test_repository_exists
end

Given 'an archivist user is logged in' do
  login_archivist
end

When 'the user clicks on {string}' do |string|
  click_on_string string
end

When 'the user clicks on {string} in the confirm popup' do |string|
  within '#confirmChangesModal' do
    click_on_string string
  end
end

When 'the user fills in {string}' do |label|
  @uuid = SecureRandom.uuid if @uuid.nil?

  fill_in label, with: @uuid
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
  expect(find('.alert.alert-success.with-hide-alert').text).to match(/^#{string}.*created$/i)
end

Then('the {string} updated message is displayed') do |string|
  expect(find('.alert.alert-success.with-hide-alert').text).to match(/^#{string}.*updated$/i)
end

Then 'the following error messages are displayed' do |messages|
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
