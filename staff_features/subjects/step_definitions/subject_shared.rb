# frozen_string_literal: true

Given 'the user is on the New Subject page' do
  visit "#{STAFF_URL}/subjects/new"

  wait_for_ajax
end
