require 'rails_helper'

describe 'Referencelist' do

  it 'when created successfully, appears on the referencelist page' do
    visit referencelists_path
    save_and_open_page
    click_link "New Referencelist"
    expect(page).to have_content("New Referencelist")
    fill_in 'referencelist_name', with: 'tepon lista'
    click_button 'Create Referencelist'
    expect(page).to have_content("Referencelist was successfully created.")
    visit referencelists_path
    expect(page).to have_content("tepon lista")
    expect(page).to have_xpath(".//tr", count: 2)
  end

  it 'when name is blank, creation fails and does not show up on referencelist page' do
    visit referencelists_path
    click_link "New Referencelist"
    expect(page).to have_content("New Referencelist")
    fill_in 'referencelist_name', with: ''
    click_button 'Create Referencelist'

    visit referencelists_path
    expect(page).to have_xpath(".//tr", count: 1)
  end

end