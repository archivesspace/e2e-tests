# frozen_string_literal: true

Then 'the Container Profile is in the search results' do
  expect(page).to have_css('tr', text: @uuid)
end

When 'the user filters by text with the Container Profile name' do
  fill_in 'Filter by text', with: @uuid

  find('#filter-text').send_keys(:enter)

  rows = []
  checks = 0

  while checks < 5
    checks += 1

    begin
      rows = all('tr', text: @uuid)
    rescue Selenium::WebDriver::Error::JavascriptError
      sleep 1
    end

    break if rows.length == 1
  end
end

Then 'the Container Profile view page is displayed' do
  expect(find('h2').text).to eq "Container Profile #{@uuid}"
end

Given 'two Container Profiles have been created with a common keyword in their name' do
  @shared_container_profile_uuid = SecureRandom.uuid
  @container_profile_a_uuid = SecureRandom.uuid
  @container_profile_b_uuid = SecureRandom.uuid

  visit "#{STAFF_URL}/container_profiles/new"
  fill_in 'container_profile_name_', with: "Container Profile A #{@shared_container_profile_uuid} #{@container_profile_a_uuid}"
  fill_in 'container_profile_depth_', with: '1.1'
  fill_in 'container_profile_height_', with: '2.2'
  fill_in 'container_profile_width_', with: '3.3'
  click_on 'Save'
  expect(find('.alert.alert-success.with-hide-alert').text).to eq 'Container Profile Created'
  url_parts = current_url.split('container_profiles/container_profile_person').pop.split('/')
  @container_profile_a_id = url_parts.pop

  visit "#{STAFF_URL}/container_profiles/new"
  fill_in 'container_profile_name_', with: "Container Profile B #{@shared_container_profile_uuid} #{@container_profile_b_uuid}"
  fill_in 'container_profile_depth_', with: '1.1'
  fill_in 'container_profile_height_', with: '2.2'
  fill_in 'container_profile_width_', with: '3.3'
  click_on 'Save'
  expect(find('.alert.alert-success.with-hide-alert').text).to eq 'Container Profile Created'
  url_parts = current_url.split('container_profiles/container_profile_person').pop.split('/')
  url_parts.pop
  @container_profile_b_id = url_parts.pop
end

Given 'the two Container Profiles are displayed sorted by ascending name' do
  visit "#{STAFF_URL}/container_profiles"

  fill_in 'filter-text', with: @shared_container_profile_uuid

  within '.search-filter' do
    find('button').click
  end

  search_result_rows = all('#tabledSearchResults tbody tr')

  expect(search_result_rows.length).to eq 2
  expect(search_result_rows[0]).to have_text @container_profile_a_uuid
  expect(search_result_rows[1]).to have_text @container_profile_b_uuid
end

Then 'the two Container Profiles are displayed sorted by descending name' do
  search_result_rows = all('#tabledSearchResults tbody tr')

  expect(search_result_rows.length).to eq 2
  expect(search_result_rows[1]).to have_text @container_profile_a_uuid
  expect(search_result_rows[0]).to have_text @container_profile_b_uuid
end

Given 'the two Container Profiles are displayed in the search results' do
  visit "#{STAFF_URL}/container_profiles"

  fill_in 'filter-text', with: @shared_container_profile_uuid

  within '.search-filter' do
    find('button').click
  end

  search_result_rows = all('#tabledSearchResults tbody tr')

  expect(search_result_rows.length).to eq 2
  expect(search_result_rows[0]).to have_text @container_profile_a_uuid
  expect(search_result_rows[1]).to have_text @container_profile_b_uuid
end

Then 'a CSV file is downloaded with the two Container Profiles' do
  files = Dir.glob(File.join(Dir.tmpdir, '*.csv'))

  downloaded_file = nil
  files.each do |file|
    downloaded_file = file if file.include?('container profiles')
  end

  expect(downloaded_file).to_not eq nil

  load_file = File.read(downloaded_file)
  expect(load_file).to include @container_profile_a_uuid
  expect(load_file).to include @container_profile_b_uuid
  expect(load_file).to include "Container Profile A #{@shared_container_profile_uuid} #{@container_profile_a_uuid}"
  expect(load_file).to include "Container Profile B #{@shared_container_profile_uuid} #{@container_profile_b_uuid}"
end
