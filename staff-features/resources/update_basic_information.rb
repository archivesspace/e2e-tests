# frozen_string_literal: true

Given 'a resource has been created' do
  @uuid = SecureRandom.uuid

  visit "#{STAFF_URL}/resources/new"

  create_resource(@uuid)
end

Given 'the user is on the resource edit page' do
  search(@uuid)

  click_on 'Edit'
end

When 'the user checks Publish?' do
  find('#resource_publish_').check
end

When 'the user checks Restrictions Apply?' do
  find('#resource_restrictions_').check
end

When 'the user fills in Repository Processing Note with {string}' do |value|
  fill_in 'Repository Processing Note', with: value
end

When 'the user changes the resource Title' do
  fill_in 'resource_title_', with: 'Resource title chagned'
end

When 'the user changes the resource Identifier' do
  fill_in 'resource_id_0_', with: 'Resource identifier chagned'
end

Then 'the resource is updated' do
  element = find('.alert.alert-success.with-hide-alert')
  expect(element.text).to eq "Resource Resource #{@uuid} updated"
end

Then 'Resource Type has value Records' do
  element = find('#resource_resource_type_')
  expect(element.value).to eq 'records'
end

Then 'Publish? is checked' do
  expect(find('#resource_publish_').check.checked?).to eq true
end

Then 'Restrictions Apply? is checked' do
  expect(find('#resource_restrictions_').check.checked?).to eq true
end

Then 'Repository Processing Note has value {string}' do |value|
  expect(find('#resource_repository_processing_note_').value).to eq value
end

Then('the resource Title does not change') do
  expect(find('#resource_title_').value).to eq "Resource #{@uuid}"
end

Then('the resource Identifier does not change') do
  expect(find('#resource_id_0_').value).to eq "Resource #{@uuid}"
end
