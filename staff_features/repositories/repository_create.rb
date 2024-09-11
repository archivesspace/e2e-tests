# frozen_string_literal: true

Then 'the {string} option is not displayed in the dropdown menu' do |string|
  expect(page).to_not have_text string
end
