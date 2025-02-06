# frozen_string_literal: true

Given 'the user is on Agents page' do
  visit "#{STAFF_URL}/agents"
end

When 'the user checks Source in the Name Forms form' do
  byebug

  find('#required_fields__source_').click
  check '#required_fields__source_'
end
