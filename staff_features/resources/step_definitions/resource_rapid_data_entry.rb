# frozen_string_literal: true

When 'the user selects {string} from {string} in the first row of the Rapid Data Entry table' do |option, label|
  table_header_cells = all('.fieldset-labels .kiketable-th-text')

  label_position = 0
  table_header_cells.each_with_index do |header, index|
    label_position = index if header.text == label
  end

  label_position += 1
  expect(label_position).to_not eq 0

  table_field_cells = all('#rdeTable tbody td')
  field_cell = table_field_cells[label_position]
  field_cell_select = field_cell.find('select')
  field_cell_select.select option
end

When 'the user fills in {string} with {string} in the first row of the Rapid Data Entry table' do |label, value|
  table_header_cells = all('.fieldset-labels .kiketable-th-text')

  label_position = 0
  table_header_cells.each_with_index do |header, index|
    label_position = index if header.text == label
  end

  label_position += 1
  expect(label_position).to_not eq 0

  table_field_cells = all('#rdeTable tbody td')
  field_cell = table_field_cells[label_position]
  field_cell_input = field_cell.find('input')
  field_cell_input.fill_in with: value
end

Then 'a new row with the following data is added to the Rapid Data Entry table' do |form_values_table|
  table_header_cells = all('.fieldset-labels .kiketable-th-text')
  table_field_rows = all('#rdeTable tbody tr')

  expect(table_field_rows.length).to eq 2

  form_values_hash = form_values_table.rows_hash
  form_values_hash.each do |field, value|
    field_position = 0
    table_header_cells.each_with_index do |header, index|
      field_position = index if header.text == field
    end
    field_position += 1
    expect(field_position).to_not eq 0

    table_field_cells = table_field_rows[1].all('td')
    field_cell = table_field_cells[field_position]

    expect(field_cell.find('input, select, textarea').value.downcase.gsub(' ', '_')).to eq value.downcase.gsub(' ', '_')
  end
end

Then 'a new template with name {string} with the following data is added to the Rapid Data Entry templates' do |template, form_values_table|
  visit "#{STAFF_URL}/resources/#{@resource_id}/edit"
  click_on 'Rapid Data Entry'
  wait_for_ajax

  click_on 'Apply an RDE Template'
  find('a span', text: template, match: :first).click

  table_header_cells = all('.fieldset-labels .kiketable-th-text')
  table_field_rows = all('#rdeTable tbody tr')

  expect(table_field_rows.length).to eq 1

  form_values_hash = form_values_table.rows_hash
  form_values_hash.each do |field, value|
    field_position = 0
    table_header_cells.each_with_index do |header, index|
      field_position = index if header.text == field
    end
    field_position += 1
    expect(field_position).to_not eq 0

    table_field_cells = table_field_rows[0].all('td')
    field_cell = table_field_cells[field_position]

    expect(field_cell.find('input, select, textarea').value.downcase.gsub(' ', '_')).to eq value.downcase.gsub(' ', '_')
  end
end

Given 'a Radpid Data Entry template has been created' do
  visit "#{STAFF_URL}/resources/#{@resource_id}/edit"
  click_on 'Rapid Data Entry'
  wait_for_ajax

  click_on 'Save as Template'
  fill_in 'templateName', with: "RDE Template #{@uuid}"
  click_on 'Save Template'

  visit "#{STAFF_URL}/resources/#{@resource_id}/edit"
  wait_for_ajax
end

When 'the user checks the created Rapid Data Entry template' do
  find('label', text: "RDE Template #{@uuid}").click
end

Then 'the template is removed from the Rapid Data Entry templates' do
  visit "#{STAFF_URL}/resources/#{@resource_id}/edit"
  click_on 'Rapid Data Entry'
  wait_for_ajax
  click_on 'Apply an RDE Template'

  expect(find('.dropdown-menu')).to_not have_text "RDE Template #{@uuid}"
end

When 'the user unchecks the {string} checkbox in the dropdown menu' do |label|
  uncheck label
end

Then 'the {string} column is no longer visible in the Rapid Data Entry table' do |string|
  expect(page).to_not have_css('.fieldset-label.sticky.kiketable-th', text: string)
end

Then 'the {string} has value {string} in all rows' do |label, value|
  table_header_cells = all('.fieldset-labels .kiketable-th-text')

  label_position = 0
  table_header_cells.each_with_index do |header, index|
    label_position = index if header.text == label
  end

  label_position += 1
  expect(label_position).to_not eq 0

  table_rows = all('#rdeTable tbody tr')
  table_rows.each do |row|
    cell = row.all('td')
    expect(cell[label_position].find('select').value.downcase).to eq value.downcase
  end
end

Given 'a Rapid Data Entry template has been created' do
  click_on 'Rapid Data Entry'
  click_on 'Save as Template'
  fill_in 'Template name', with: "RDE Template  #{@uuid}"
  click_on 'Save Template'
end
