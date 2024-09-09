# frozen_string_literal: true

Given 'a Resource has been created' do
  @uuid = SecureRandom.uuid

  visit "#{STAFF_URL}/resources/new"

  create_resource(@uuid)
end

Given 'the user is on the Resource edit page' do
  search(@uuid)

  click_on 'Edit'
end

Then 'Repository Processing Note has value {string}' do |value|
  expect(find('#resource_repository_processing_note_').value).to eq value
end