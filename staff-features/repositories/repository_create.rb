# frozen_string_literal: true

When 'the user fills in the Repository Short Name' do
  @uuid = SecureRandom.uuid

  fill_in 'Repository Short Name', with: "Repository Short Name #{@uuid}"
end

When 'the user fills in the Repository Name' do
  @uuid = SecureRandom.uuid

  fill_in 'Repository Name', with: "Repository Name #{@uuid}"
end

Then 'Manage Repositories option does not appear in the dropdown menu' do
  expect(page).to_not have_text 'Manage Repositories'
end
