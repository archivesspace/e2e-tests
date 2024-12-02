# frozen_string_literal: true

Given 'the Resource is opened in the view mode' do
  visit "#{STAFF_URL}/resources/#{@resource_id}"
end

Given 'the Resource is opened in edit mode' do
  visit "#{STAFF_URL}/resources/#{@resource_id}/edit"
end

Given 'the Resource is published' do
  expect(find('#resource_publish_').checked?).to eq true
end

Given 'the {string} button is displayed' do |button_text|
  expect(page).to have_css('a', text: button_text)
end

Then 'the Resource opens on a new tab in the public interface' do
  expect(page.windows.size).to eq 2
  expect(page).to have_text "Resource #{@uuid}"
end
