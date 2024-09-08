# frozen_string_literal: true

Given('the user is on the New Accession page') do
  @uuid = SecureRandom.uuid

  click_on 'Create'
  click_on 'Accession'
end
