# frozen_string_literal: true

Given 'the user is on the Manage Users page' do
  click_on 'System'
  click_on 'Manage Users'
end

When 'the user fills in the Username' do
  @uuid = SecureRandom.uuid

  fill_in 'Username', with: "Username #{@uuid}"
end

When 'the user fills in the Full name' do
  fill_in 'Full name', with: "Full name #{@uuid}"
end

When 'the user fills in the Password' do
  fill_in 'Password', with: "password #{@uuid}"
end

When 'the user fills in the Confirm password' do
  fill_in 'Confirm password', with: "password #{@uuid}"
end

And 'the new user should appear in the search results' do
  expect_record_to_be_in_search_results(@uuid)
end
