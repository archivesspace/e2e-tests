Given('the web browser is on the create accession page') do
  @uuid = SecureRandom.uuid

  click_on 'Create'
  click_on 'Accession'
end

When('the user fills in all the required fields') do
  fill_in 'accession_id_0_', with: "Accession #{@uuid}"
end

When('the user does not fill in all the required fields') do
  fill_in 'accession_id_0_', with: ''
end

When('the user clicks on Save') do
  click_button 'Save'
end

Then('a new accession is created') do
  expect(find('h2').text).to eq "Accession #{@uuid} Accession"
  expect(find('.alert.alert-success.with-hide-alert').text).to eq 'Accession created'

  expect_record_to_be_in_search_results(@uuid)
end

Then('a new accession is not created') do
  expect(find('h2').text).to eq 'New Accession Accession'
  expect(find('.alert.alert-danger.with-hide-alert').text).to eq 'Identifier - Property is required but was missing'

  expect_record_to_not_be_in_search_results(@uuid)
end
