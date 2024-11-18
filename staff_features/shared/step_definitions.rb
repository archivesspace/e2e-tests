# frozen_string_literal: true

Before do
  @uuid = SecureRandom.uuid
end

Given 'an administrator user is logged in' do
  login_admin

  ensure_test_repository_exists
  ensure_test_user_exists
  ensure_test_agent_exists
end

Given 'an archivist user is logged in' do
  login_archivist
end

When 'the user clicks on {string}' do |string|
  click_on_string string
end

When 'the user clicks on {string} in the dropdown menu' do |string|
  within '.dropdown-menu' do |dropdown_menu|
    elements = dropdown_menu.all(:xpath, "//*[contains(text(), '#{string}')]")
    elements[1].click
  end
end

When 'the user clicks on {string} in the spawn dropdown menu' do |string|
  within '#spawn-dropdown' do
    click_on_string string
  end
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

When 'the user clears the {string} field' do |label|
  fill_in label, with: ''
end

When 'the user fills in {string} with {string}' do |label, value|
  fill_in label, with: value
end

When 'the user fills in {string} with {string} in the {string} form' do |label, value, form_title|
  section_title = find('h3', text: form_title)
  section = section_title.ancestor('section')
  expect(section[:id]).to_not eq nil

  within section do
    fill_in label, with: value
  end
end

When 'the user fills in {string} with {string} and selects {string} in the {string} form' do |label, value, selected_value, form_title|
  section_title = find('h3', text: form_title)
  section = section_title.ancestor('section')
  expect(section[:id]).to_not eq nil

  within section do
    fill_in label, with: value

    dropdown_items = all('li.dropdown-item a', text: selected_value).select do |entry|
      entry.text == selected_value
    end

    expect(dropdown_items.length).to eq 1
    expect(dropdown_items[0].text).to eq selected_value
    dropdown_items[0].click
  end
end

When 'the user selects {string} from {string}' do |option, label|
  select option, from: label
end

When 'the user selects {string} from {string} in the {string} form' do |option, label, form_title|
  section_title = find('h3', text: form_title)
  section = section_title.ancestor('section')
  expect(section[:id]).to_not eq nil

  within section do
    select option, from: label
  end
end

When 'the user checks {string}' do |label|
  check label
end

When 'the user changes the {string} field to {string}' do |field, value|
  fill_in field, with: value
end

When 'the user changes the {string} field' do |field|
  fill_in field, with: SecureRandom.uuid
end

Then('the {string} created message is displayed') do |string|
  expect(find('.alert.alert-success.with-hide-alert').text).to match(/^#{string}.*created.*$/i)
end

Then('the {string} updated message is displayed') do |string|
  expect(find('.alert.alert-success.with-hide-alert').text).to match(/^#{string}.*updated$/i)
end

Then('the {string} deleted message is displayed') do |string|
  expect(find('.alert.alert-success.with-hide-alert').text).to match(/^#{string}.*deleted$/i)
end

Then 'only the following info message is displayed' do |messages|
  expect(messages.raw.length).to eq 1

  messages.raw.each do |message|
    expect(page).to have_text message[0]
  end
end

Then 'the following error messages are displayed' do |messages|
  messages.raw.each do |message|
    expect(page).to have_text message[0]
  end
end

Then 'the following error message is displayed' do |messages|
  expect(messages.raw.length).to eq 1

  messages.raw.each do |message|
    expect(page).to have_text message[0]
  end
end

Then 'the {string} has value {string}' do |label, value|
  expect(page).to have_field(label, with: value)
end

Then 'the {string} has a unique value' do |label|
  expect(page).to have_field(label, with: @uuid, match: :first)
end

Then 'the {string} has selected value {string}' do |label, value|
  expect(page).to have_select(label, selected: value)
end

Then 'the {string} is checked' do |label|
  expect(page).to have_field(label, checked: true)
end

Then 'only the following error message is displayed' do |messages|
  expect(messages.raw.length).to eq 1

  messages.raw.each do |message|
    expect(page).to have_text message[0]
  end
end

Then 'the {string} section is displayed' do |section_heading|
  expect(all('section > h3').map(&:text)).to include(section_heading)
end
