def expect_record_to_be_in_search_results(search_term)
  fill_in 'global-search-box', with: search_term
  find('#global-search-button').click

  search_result_rows = all('#tabledSearchResults tbody tr')

  expect(search_result_rows.length).to eq 1
  expect(search_result_rows[0].text).to include search_term
end

def expect_record_to_not_be_in_search_results(search_term)
  fill_in 'global-search-box', with: search_term
  find('#global-search-button').click

  search_result_rows = all('#tabledSearchResults tbody tr')

  expect(search_result_rows.length).to eq 0
  expect(find('.alert.alert-info.with-hide-alert').text).to eq 'No records found'
end
