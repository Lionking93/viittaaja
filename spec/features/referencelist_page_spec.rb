require 'rails_helper'

describe 'Referencelist page' do

  before :each do
    @list = Referencelist.create name:"lista"
  end

  it 'lists all current references' do
    @list.references.create year:1990, author:"Teppo", title:"Matti", publisher:"Suomiboyz"
    @list.references.create year:1990, author:"Barack Öbämå", title:"USA", publisher:"asd"
    visit referencelist_path(@list)

    @first_reference = find('table tbody').find('tr:nth-child(1)')
    @second_reference = find('table tbody').find('tr:nth-child(2)')

    expect(@first_reference.text).to eq "1990 Suomiboyz Teppo Matti EditDestroy"
    expect(@second_reference.text).to eq "1990 asd Barack Öbämå USA EditDestroy"
  end

  it 'when a new reference is added, shows it on the page' do
    @list.references.create year:1990, author:"Teppo", title:"Matti", publisher:"Suomiboyz"
    @list.references.create year:1990, author:"Barack Öbämå", title:"USA", publisher:"asd"
    visit referencelist_path(@list)
    expect(page). to have_xpath(".//tr", count: 3)

    expect(page).not_to have_content("2000 Kebab on hyvää")

    click_link "Add book"
    fill_in 'reference_year', with: '2000'
    fill_in 'reference_publisher', with: 'Kebab'
    fill_in 'reference_author', with: 'on'
    fill_in 'reference_title', with: 'hyvää'
    click_button "Create Reference"
    expect(page).to have_xpath(".//tr", count: 4)

    expect(page).to have_content("2000 Kebab on hyvää")
  end

  it 'when bibtex-button is pressed, opens up a page showing references in bibtex format' do
    @list.references.create year:1990, author:"Barack Öbämå", title:"USA", publisher:"asd"

    visit referencelist_path(@list)

    click_link "Bibtex"

    expect(page).to have_content "Bibtex for lista"
    expect(page).to have_content "@Book{1,
                                  year = {1990},
                                  publisher = {asd},
                                  author = {Barack \\\"{O}b\\\"{a}m\\aa},
                                  title = {USA},
                                  }"
  end

end

