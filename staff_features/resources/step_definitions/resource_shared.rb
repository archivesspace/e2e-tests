# frozen_string_literal: true

When 'the user filters by text with the Resource title' do
  expect(find('h2').text).to eq 'Resources'

  fill_in 'Filter by text', with: @uuid
  find('.search-filter button').click

  rows = []
  checks = 0

  while checks < 5
    checks += 1

    begin
      rows = all('tr', text: "Resource #{@uuid}")
    rescue Selenium::WebDriver::Error::JavascriptError
      sleep 1
    end

    break if rows.length == 1
  end
end

Then 'the Resource is in the search results' do
  expect(page).to have_css('tr', text: @uuid)
end
