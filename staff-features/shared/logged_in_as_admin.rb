Given 'the user is logged in as admin' do
  visit STAFF_URL

  fill_in "username", with: 'admin'
  fill_in "password", with: 'admin'

  click_on 'Sign In'

  expect(page).to have_content 'Welcome to ArchivesSpace'
  expect(page).to have_content 'Your friendly archives management tool.'
  element = find('.global-header .user-container')
  expect(element.text.strip).to eq 'admin'
end
