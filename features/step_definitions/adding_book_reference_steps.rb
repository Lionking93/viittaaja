require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

def create_reference_list 
	visit referencelists_path
    click_link "New Referencelist"
    fill_in 'referencelist_name', with: 'tepon lista'
    click_button 'Create Referencelist'
    click_link "Add book"
end

Given (/^User is on add book page$/) do
	create_reference_list
end

Given(/^Necessary book information is inserted$/) do
  	fill_in 'reference_year', with: '1984'
  	fill_in 'reference_publisher', with: 'Big Brother'
  	fill_in 'reference_author', with: 'Orwell'
  	fill_in 'reference_title', with: 'isoveli valvoo'
end

When(/^Add book is pressed$/) do 
  	click_button "Create Reference"
end

Then(/^Book reference should be added to the system$/) do
  	expect(page).to have_content("Reference was successfully created.")
  	expect(Reference.count).to eq(1)
end

Given(/^One of the fields is left blank$/) do
	fill_in 'reference_year', with: '1984'
	fill_in 'reference_publisher', with: 'Big Brother'
	fill_in 'reference_author', with: 'Orwell'
end

Then(/^User should be told what is missing$/) do
  	expect(page).to have_content("Title can't be blank")
  	expect(Reference.count).to eq(0)
end

Given(/^A numeric value is not given when necessary$/) do
  	fill_in 'reference_year', with: 'jorma'
  	fill_in 'reference_publisher', with: 'Big Brother'
  	fill_in 'reference_author', with: 'Orwell'
  	fill_in 'reference_title', with: 'isoveli valvoo'
end

Then(/^User should be told where the false value is$/) do
  	expect(page).to have_content("Year is not a number")
  	expect(Reference.count).to eq(0)
end





