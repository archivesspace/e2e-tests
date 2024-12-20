# frozen_string_literal: true

When 'the user filters by text with the Resource title' do
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

Then 'the Resource is in the search results' do
  expect(page).to have_css('tr', text: @uuid)
end

Then 'the Resource view page is displayed' do
  expect(find('h2').text).to eq "Resource #{@uuid} Resource"
end
