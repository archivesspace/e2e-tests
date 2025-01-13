# frozen_string_literal: true

Given 'a Digital Object has been created' do
  visit "#{STAFF_URL}/digital_objects/new"

  fill_in 'digital_object_digital_object_id_', with: "Digital Object Identifier #{@uuid}"
  fill_in 'digital_object_title_', with: "Digital Object Title #{@uuid}"

  click_on 'Add Date'
  select 'Single', from: 'digital_object_dates__0__date_type_'
  fill_in 'digital_object_dates__0__begin_', with: '2000-01-01'

  @digital_object_number_of_file_versions = 0

  click_on 'Save'

  wait_for_ajax
  expect(find('.alert.alert-success.with-hide-alert').text).to have_text "Digital Object Digital Object Title #{@uuid} Created"
  @digital_object_id = current_url.split('::digital_object_').pop
end

Given 'the Digital Object appears in the search results list' do
  visit "#{STAFF_URL}/digital_objects"

  fill_in 'filter-text', with: "Digital Object Identifier #{@uuid}"

  within '.search-filter' do
    find('button').click
  end

  search_result_rows = all('#tabledSearchResults tbody tr')
  expect(search_result_rows.length).to eq 1
end

Then 'the Digital Object is opened in the edit mode' do
  wait_for_ajax
  expect(current_url).to include 'edit'
  expect(@digital_object_id).to eq current_url.split('::digital_object_').pop
end

Given 'the Digital Object is opened in the view mode' do
  visit "#{STAFF_URL}/digital_objects/#{@digital_object_id}"
end

Given 'the Digital Object is opened in edit mode' do
  visit "#{STAFF_URL}/digital_objects/#{@digital_object_id}/edit"

  wait_for_ajax
end

Then 'the Digital Object Title field has the original value' do
  visit "#{STAFF_URL}/digital_objects/#{@digital_object_id}/edit"

  expect(page).to have_field('Title', with: "Digital Object Title #{@uuid}")
end

Then 'the Digital Object Identifier field has the original value' do
  visit "#{STAFF_URL}/digital_objects/#{@digital_object_id}/edit"

  expect(page).to have_field('Identifier', with: "Digital Object Identifier #{@uuid}")
end

Then 'a new File Version is added to the Digital Object with the following values' do |form_values_table|
  subrecords = all('#digital_object_file_versions_ .subrecord-form-list li')

  expect(subrecords.length).to eq @digital_object_number_of_file_versions + 1

  created_subrecord = subrecords.last

  form_values_hash = form_values_table.rows_hash
  form_values_hash.each do |field, value|
    expect(created_subrecord.find_field(field).value).to eq value.downcase.gsub(' ', '_')
  end
end

Given 'the user has added a File Version to the Digital Object with the following values' do |form_values_table|
  click_on 'Add File Version'

  form_values_hash = form_values_table.rows_hash
  form_values_hash.each do |field, value|
    fill_in field, with: value
  end

  click_on 'Save'
  wait_for_ajax

  @digital_object_number_of_file_versions += 1
end

Then 'the File Version is removed from the Digital Object' do
  subrecords = all('#digital_object_file_versions_ .subrecord-form-list li')

  expect(subrecords.length).to eq @digital_object_number_of_file_versions - 1
end
