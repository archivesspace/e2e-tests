# frozen_string_literal: true

Given 'I am on the Manage Users page' do
  click_on 'System'
  click_on 'Manage Users'
end

When 'I fill in the Username' do
  @uuid = SecureRandom.uuid

  fill_in 'Username', with: "Username #{@uuid}"
end

When 'I fill in the Full name' do
  fill_in 'Full name', with: "Full name #{@uuid}"
end

When 'I fill in the Password' do
  fill_in 'Password', with: "password #{@uuid}"
end

When 'I fill in the Confirm password' do
  fill_in 'Confirm password', with: "password #{@uuid}"
end

And 'the new user should appear in the search results' do
  expect_record_to_be_in_search_results(@uuid)
end

Then 'the system should display the following error messages:' do |messages|
  messages.raw.each do |message|
    expect(page).to have_text message[0]
  end
end
