require 'rails_helper'

describe 'User can CRUD Events' do

  before :each do
    # visit root
    visit '/'

    # click on link to go to new User form
    click_on "New User"

    #filling out form for User
    fill_in "User name", with: "Dan"
    fill_in "Password", with: "my_pass"
    fill_in "About", with: "Really Awesome."

    click_on "Create User"

    click_on 'New Course'

    fill_in "Title", with: "maths"
    click_on 'Create Course'
  end

  it 'Can create a new course' do
    expect(page).to have_content("Course was successfully created.")
  end

  it 'Can view a course' do
    click_on "maths"
    expect(page).to have_content("Day course or night course:")
  end

  it 'Can delete a course' do
    click_on 'Delete'
    expect(page).to have_no_content("maths")
  end
end
