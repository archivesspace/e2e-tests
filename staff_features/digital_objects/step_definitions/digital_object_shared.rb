# frozen_string_literal: true

Given 'a Digital Object has been created' do
  visit "#{STAFF_URL}/digital_objects/new"

  fill_in 'digital_object_digital_object_id_', with: "Digital Object Identifier #{@uuid}"
  fill_in 'digital_object_title_', with: "Digital Object Title #{@uuid}"

  click_on 'Add Date'
  select 'Single', from: 'digital_object_dates__0__date_type_'
  fill_in 'digital_object_dates__0__begin_', with: '2000-01-01'

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

Then 'the Digital Object Component with Label {string} is saved as a child of the Digital Object' do |text|
  records = all('#tree-container .table-row', text:)

  expect(records.length).to eq 1
  expect(records[0][:class]).to include 'indent-level-1 current'

  expect(page).to have_css "#tree-container #digital_object_#{@digital_object_id} + .table-row-group #digital_object_component_#{@created_record_id}"
end

Then 'the Digital Object Component with Title {string} is saved as a sibling of the selected Digital Object Component' do |title|
  records = all('#tree-container .table-row', text: title)

  expect(records.length).to eq 1
  expect(records[0][:class]).to include 'indent-level-1 current'
  expect(page).to have_css "#tree-container #digital_object_#{@digital_object_id} + .table-row-group #digital_object_component_#{@created_record_id}"
end

Given 'a Digital Object with a Digital Object Component has been created' do
  visit "#{STAFF_URL}/digital_objects/new"

  fill_in 'digital_object_digital_object_id_', with: "Digital Object Identifier #{@uuid}"
  fill_in 'digital_object_title_', with: "Digital Object Title #{@uuid}"

  click_on 'Add Date'
  select 'Single', from: 'digital_object_dates__0__date_type_'
  fill_in 'digital_object_dates__0__begin_', with: '2000-01-01'

  click_on 'Save'

  wait_for_ajax
  expect(find('.alert.alert-success.with-hide-alert').text).to have_text "Digital Object Digital Object Title #{@uuid} Created"
  @digital_object_id = current_url.split('::digital_object_').pop

  click_on 'Add Child'
  wait_for_ajax

  fill_in 'Label', with: "Digital Object Component Label #{@uuid}"
  click_on 'Save'
  wait_for_ajax

  expect(find('.alert.alert-success.with-hide-alert').text).to eq "Digital Object Component created on Digital Object Digital Object Title #{@uuid}"
end

And 'the user selects the Digital Object Component' do
  click_on "Digital Object Component Label #{@uuid}"
end
