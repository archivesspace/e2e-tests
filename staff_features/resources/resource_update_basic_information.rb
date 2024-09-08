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

When 'the user changes the resource Title' do
  fill_in 'resource_title_', with: 'Resource title chagned'
end

When 'the user changes the resource Identifier' do
  fill_in 'resource_id_0_', with: 'Resource identifier chagned'
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
