# frozen_string_literal: true

Before do
  @uuid = SecureRandom.uuid
end

Given 'an administrator user is logged in' do
  visit "#{STAFF_URL}/logout"

  login_admin

  ensure_test_repository_exists
  ensure_test_user_exists
  ensure_test_agent_exists
  ensure_test_subject_exists
  ensure_test_classification_exists
end

Given 'an archivist user is logged in' do
  login_archivist
end

Given 'a Repository with name {string} has been created' do |repository_name|
  visit "#{STAFF_URL}/repositories"

  fill_in 'filter-text', with: repository_name

  within '.search-filter' do
    find('button').click
  end

  begin
    find('tr', text: repository_name, match: :first)
  rescue Capybara::ElementNotFound
    visit "#{STAFF_URL}/repositories/new"
    fill_in 'Repository Short Name', with: repository_name
    fill_in 'Repository Name', with: repository_name

    click_on 'Save'
  end
end

When 'the user clicks on {string}' do |string|
  click_on_string string
end

When 'the user clicks on {string} in the record toolbar' do |string|
  within '.record-toolbar' do
    click_on_string string
  end
end

When 'the user clicks on {string} in the modal' do |string|
  within '.modal-content' do
    click_on_string string
  end
end

When 'the user clicks on {string} in the transfer form' do |string|
  dropdown_menu = find('.transfer-form')

  within dropdown_menu do
    click_on_string string
  end
end

When 'the user clicks on {string} in the dropdown menu' do |string|
  within '.dropdown-menu' do |dropdown_menu|
    elements = dropdown_menu.all(:xpath, ".//*[contains(text(), '#{string}')]")

    elements.each do |element|
      if (element.tag_name == 'button' || element.tag_name == 'a') && element.text == string
        element.click
        break
      end
    end
  end
end

When 'the user clicks on {string} in the spawn dropdown menu' do |string|
  within '#spawn-dropdown' do
    click_on_string string
  end
end

When 'the user clicks on the first dropdown in the {string} form' do |form_title|
  section_title = find('h3', text: form_title)
  section = section_title.ancestor('section')
  expect(section[:id]).to_not eq nil

  within section do
    find('.dropdown-toggle', match: :first).click
  end
end

When 'the user clicks on {string} in the {string} form' do |string, form_title|
  section_title = find('h3', text: form_title)
  section = section_title.ancestor('section')
  expect(section[:id]).to_not eq nil

  within section do
    click_on string
  end
end

When 'the user clicks on {string} in the dropdown menu in the {string} form' do |string, form_title|
  section_title = find('h3', text: form_title)
  section = section_title.ancestor('section')
  expect(section[:id]).to_not eq nil

  within section do
    dropdown_menu = find('.dropdown-menu')

    within dropdown_menu do
      click_on string
    end
  end
end

When 'the user fills in {string}' do |label|
  @uuid = SecureRandom.uuid if @uuid.nil?

  fill_in label, with: @uuid, match: :first
end

When 'the user clears the {string} field' do |label|
  fill_in label, with: '', match: :first
end

When 'the user fills in {string} with {string}' do |label, value|
  fill_in label, with: value, match: :first
end

When 'the user fills in {string} with {string} in the modal' do |label, value|
  within '.modal-content' do
    fill_in label, with: value, match: :first
  end
end

When 'the user clicks on remove icon in the {string} form' do |form_title|
  section_title = find('h3', text: form_title)
  section = section_title.ancestor('section')
  expect(section[:id]).to_not eq nil

  within section do
    find('.subrecord-form-remove').click
    expect(page).to have_text 'Confirm Removal'
  end
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
  select option, from: label, match: :first
end

When 'the user selects {string} from {string} in the modal' do |option, label|
  within '.modal-content' do
    select option, from: label
  end
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
  check label, match: :first
end

When 'the user changes the {string} field to {string}' do |field, value|
  fill_in field, with: value, match: :first
end

When 'the user changes the {string} field' do |field|
  fill_in field, with: SecureRandom.uuid, match: :first
end

Then('the {string} created message is displayed') do |string|
  wait_for_ajax if current_url.include? 'resources'

  expect(find('.alert.alert-success.with-hide-alert').text).to match(/^#{string}.*created.*$/i)
end

Then('the {string} updated message is displayed') do |string|
  wait_for_ajax

  expect(find('.alert.alert-success.with-hide-alert').text).to match(/^#{string}.*updated$/i)
end

Then('the {string} deleted message is displayed') do |string|
  expect(find('.alert.alert-success.with-hide-alert').text).to match(/^#{string}.*deleted$/i)
end

Then 'the following message is displayed' do |messages|
  messages.raw.each do |message|
    expect(page).to have_text message[0]
  end
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
