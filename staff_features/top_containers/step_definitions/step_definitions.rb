# frozen_string_literal: true

When 'the user fills in {string} with the Resource title' do |label|
  fill_in label, with: @uuid
end

When 'the user fills in {string} with the Accession title' do |label|
  fill_in label, with: @uuid
end

Then 'the Top Container associated with the Resource is in the search results' do
  results = all('#bulk_operation_results tbody tr')
  expect(results.length).to eq 1
  expect(results[0].text).to include @uuid
end

Then 'the Top Container associated with the Accession is in the search results' do
  results = all('#bulk_operation_results tbody tr')
  expect(results.length).to eq 1
  expect(results[0].text).to include @uuid
end
