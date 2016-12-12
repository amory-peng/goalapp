require 'spec_helper'
require 'rails_helper'


feature "the signup process" do

  before(:each) do
    visit new_user_url
    fill_in 'Username', with: "testing_username"
    fill_in 'Password', with: "biscuits"
    click_on "Create User"
  end

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content("New User")
  end


  feature "signing up a user" do

  before(:each) do
    visit new_user_url
    fill_in 'Username', with: "testing_username"
    fill_in 'Password', with: "biscuits"
    click_on "Create User"
  end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content("testing_username")
    end

  end

end

feature "logging in" do

before(:each) do
  visit new_user_url
  fill_in 'Username', with: "testing_username"
  fill_in 'Password', with: "biscuits"
  click_on "Create User"
end

  scenario "shows username on the homepage after login" do
    visit new_session_url
    fill_in 'Username', with: "testing_username"
    fill_in 'Password', with: "biscuits"
    click_on "Sign In"
    expect(page).to have_content("testing_username")
  end

end

feature "logging out" do

before(:each) do
  visit new_user_url
  fill_in 'Username', with: "testing_username"
  fill_in 'Password', with: "biscuits"
  click_on "Create User"
end

  scenario "begins with a logged out state" do
    visit new_session_url
    expect(page).to have_content("Sign In")
  end

  scenario "doesn't show username on the homepage after logout" do
    visit new_session_url
    fill_in 'Username', with: "testing_username"
    fill_in 'Password', with: "biscuits"
    click_on "Sign In"
    click_on "Sign Out"
    expect(page).not_to have_content("testing_username")
  end

end
