# frozen_string_literal: true

Given 'the Resource appears in the search results list' do
  visit "#{STAFF_URL}/resources"

  fill_in 'filter-text', with: @uuid

  within '.search-filter' do
    find('button').click
  end

  search_result_rows = all('#tabledSearchResults tbody tr')
  expect(search_result_rows.length).to eq 1

  within search_result_rows[0] do
    element = find('a', text: 'Edit')

    @resource_id = URI.decode_www_form_component(element[:href]).split('/').pop
  end
end

Given 'the Resource is opened in the view mode' do
  visit "#{STAFF_URL}/resources/#{@resource_id}"
end

Given 'the Resource has one Language' do
  languages = all('#resource_lang_materials_ .subrecord-form-list .subrecord-form-wrapper')

  expect(languages.length).to eq 1
end

Given 'the Resource has one Note' do
  notes = all('#resource_notes_ .subrecord-form-list .subrecord-form-wrapper')

  expect(notes.length).to eq 1
end

Then 'the Resource is opened in the edit mode' do
  uri = current_url.split('/')

  action = uri.pop
  resource_id = uri.pop

  expect(action).to include 'edit'
  expect(resource_id).to eq @resource_id
end

Then 'the Resource Title field has the original value' do
  visit "#{STAFF_URL}/resources/#{@resource_id}/edit"
  wait_for_ajax

  expect(page).to have_field('Title', with: "Resource #{@uuid}", match: :first)
end

Then 'the Resource Begin field has the original value' do
  visit "#{STAFF_URL}/resources/#{@resource_id}/edit"
  wait_for_ajax

  expect(page).to have_field('Begin', with: ORIGINAL_RESOURCE_DATE, match: :first)
end

Then 'the Resource has one Language with the original values' do
  visit "#{STAFF_URL}/resources/#{@resource_id}/edit"
  wait_for_ajax

  languages = all('#resource_lang_materials_ .subrecord-form-wrapper')

  expect(languages.length).to eq 1
  expect(find('#resource_lang_materials__0__language_and_script__language_').value).to eq 'Australian languages'
end

Then 'the Resource does not have Notes' do
  visit "#{STAFF_URL}/resources/#{@resource_id}/edit"
  wait_for_ajax

  notes = all('#resource_notes_ .subrecord-form-wrapper')
  expect(notes.length).to eq 0
end
