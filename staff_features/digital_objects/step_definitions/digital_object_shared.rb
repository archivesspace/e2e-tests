# frozen_string_literal: true

Given 'a Digital Object has been created' do
  visit "#{STAFF_URL}/digital_objects/new"

  fill_in 'digital_object_digital_object_id_', with: "Digital Object Identifier #{@uuid}"
  fill_in 'digital_object_title_', with: "Digital Object Title #{@uuid}"
  check 'digital_object_publish_'

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

Given 'the Digital Object is published' do
  expect(find('#digital_object_publish_').value).to eq '1'
end

Then 'the Digital Object opens on a new tab in the public interface' do
  expect(page.windows.size).to eq 2
  switch_to_window(page.windows[1])

  tries = 0

  while current_url == 'about:blank'
    break if tries == 3

    tries += 1
    sleep 1
  end

  expect(current_url).to eq "#{PUBLIC_URL}/repositories/#{@repository_id}/digital_objects/#{@digital_object_id}"
  expect(page).to have_text "Digital Object Title #{@uuid}"
end
