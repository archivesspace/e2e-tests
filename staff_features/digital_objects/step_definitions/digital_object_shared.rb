# frozen_string_literal: true

Given 'a Digital Object has been created' do
  visit "#{STAFF_URL}/digital_objects/new"

  fill_in 'digital_object_digital_object_id_', with: "Digital Object Identifier #{@uuid}"
  fill_in 'digital_object_title_', with: "Digital Object Title #{@uuid}"

  click_on 'Add Date'
  select 'Single', from: 'digital_object_dates__0__date_type_'
  fill_in 'digital_object_dates__0__begin_', with: '2000-01-01'

  click_on 'Save'

  wait_for_ajax
  expect(find('.alert.alert-success.with-hide-alert').text).to have_text "Digital Object Digital Object Title #{@uuid} Created"
  @digital_object_id = current_url.split('::digital_object_').pop
end

Given 'the user is on the Digital Objects page' do
  visit "#{STAFF_URL}/digital_objects"
end
