# frozen_string_literal: true

Given 'the Resource is opened in the view mode' do
  visit "#{STAFF_URL}/resources/#{@resource_id}"
end

Given 'the Resource is opened in edit mode' do
  visit "#{STAFF_URL}/resources/#{@resource_id}/edit"
  wait_for_ajax
end

Given 'the Resource is published' do
  expect(find('#resource_publish_').checked?).to eq true
end

Given 'the {string} button is displayed' do |button_text|
  expect(page).to have_css('a', text: button_text)
end

Then 'the Resource opens on a new tab in the public interface' do
  expect(page.windows.size).to eq 2
  switch_to_window(page.windows[1])

  tries = 0

  while current_url == 'about:blank'
    break if tries == 3

    tries += 1
    sleep 1
  end

  expect(current_url).to eq "#{PUBLIC_URL}/repositories/#{@repository_id}/resources/#{@resource_id}"
  expect(page).to have_text "Resource #{@uuid}"
end
