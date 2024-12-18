# frozen_string_literal: true

Given 'a Digital Object has been created' do
  visit "#{STAFF_URL}/digital_objects/new"

  fill_in 'Title', with: "Digital Object Title #{@uuid}"
  fill_in 'Identifier', with: "Digital Object Identifier #{@uuid}"

  click_on 'Save'

  expect(find('.alert').text).to eq "Digital Object Digital Object Title #{@uuid} Created"
end
