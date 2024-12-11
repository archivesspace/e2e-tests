# frozen_string_literal: true

Given 'the Pre-populate Records option is checked in Repository Preferences' do
  visit "#{STAFF_URL}/repositories/new"

  fill_in 'repository_repository__repo_code_', with: 'repository_test_resource_edit_default_values'
  fill_in 'repository_repository__name_', with: 'Repository Test Resource Edit Default Values'
  find('#repository_repository__publish_').check
  click_on 'Save'

  message = find('.alert')

  # Attempting to create a repository with the values above,
  # may result in a success message or one of the following errors.
  repository_exists = message.text == 'Repository Short Name - The repository short name must be unique within this ArchivesSpace'
  repository_created = message.text == 'Repository Created'
  agent_records_message = message.text == 'Agent records cannot be identical'
  expect(repository_exists || repository_created || agent_records_message).to eq true

  visit STAFF_URL

  click_on 'Select Repository'
  within '.dropdown-menu' do
    find('select').select 'repository_test_resource_edit_default_values'

    click_on 'Select Repository'
  end

  expect(page).to have_text 'The Repository repository_test_resource_edit_default_values is now active'

  find('#user-menu-dropdown').click
  within '.dropdown-menu' do
    click_on 'Repository Preferences (admin)'
  end

  find('#preference_defaults__default_values_').check

  click_on 'Save'
end

Given 'the user is on the Resources page' do
  visit "#{STAFF_URL}/resources"
end

Then 'the Resource Record Defaults page is displayed' do
  expect(current_url).to include 'resources/defaults'
end

Given 'the user is on the Resource Record Default page' do
  visit "#{STAFF_URL}/resources/defaults"
end

Then 'the new Resource form has the following default values' do |form_values_table|
  visit "#{STAFF_URL}/resources/new"

  form_values = form_values_table.hashes

  form_values.each do |row|
    section_title = find('h3', text: row['form_section'])
    section = section_title.ancestor('section')
    expect(section[:id]).to_not eq nil

    within section do
      field = find_field(row['form_field'])

      expect(field.value.downcase).to eq row['form_value'].downcase
    end
  end
end
