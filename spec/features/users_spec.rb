require 'rails_helper'

describe 'User can CRUD Events' do

  before :each do

  end

  it 'Can create user' do
    # visit root
    visit '/'

    # click on link to go to new User form
    click_on "New User"

    #filling out form for User
    fill_in "User name", with: "Dan"
    fill_in "Password", with: "my_pass"
    fill_in "About", with: "Really Awesome."

    click_on "Create User"
    expect(page).to have_content("User was successfully created")
  end

  it 'Does not accept no password' do
    #visit root
    visit '/'

    # click on link to go to new User form
    click_on "New User"

    #dont fill in user_name
    fill_in "User name", with: "Dan"
    fill_in "About", with: "Really Awesome."

    click_on "Create User"

    expect(page).to have_content("User was not successfully created.")
  end

  it 'Does not accept no user_name' do
    #visit root
    visit '/'

    # click on link to go to new User form
    click_on "New User"

    #dont fill in user_name
    fill_in "Password", with: "my_pass"
    fill_in "About", with: "Really Awesome."

    click_on "Create User"

    expect(page).to have_content("User was not successfully created.")
  end

  it 'Does not accept used user_name' do
    #visit root
    visit '/'

    # click on link to go to new User form
    click_on "New User"

    #dont fill in user_name
    fill_in "User name", with: "Dan"
    fill_in "Password", with: "my_pass"
    fill_in "About", with: "Really Awesome."

    click_on "Create User"

    #visit root
    visit '/'

    # click on link to go to new User form
    click_on "Signout"

    click_on "New User"

    #dont fill in user_name
    fill_in "User name", with: "Dan"
    fill_in "Password", with: "my_pass"
    fill_in "About", with: "Really Awesome."

    click_on "Create User"

    expect(page).to have_content("User was not successfully created.")
  end
end
