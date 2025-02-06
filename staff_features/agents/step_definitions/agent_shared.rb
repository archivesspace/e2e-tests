# frozen_string_literal: true

Given 'an Agent has been created' do
  visit "#{STAFF_URL}/agents/agent_person/new"

  fill_in 'Primary Part of Name', with: @uuid

  click_on 'Save'

  expect(find('.alert.alert-success.with-hide-alert').text).to eq 'Agent Created'

  url_parts = current_url.split('agents/agent_person').pop.split('/')
  url_parts.pop
  @agent_id = url_parts.pop
end
