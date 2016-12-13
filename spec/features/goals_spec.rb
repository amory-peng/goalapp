require 'spec_helper'
require 'rails_helper'

feature "displaying user goals" do
  # let!(:goal1) { Goal.create(description: "Pass A4", user_id: 1) }
  # let!(:goal2) { Goal.create(description: "Pass A5", user_id: 1, status: "public") }
  # let!(:goal3) { Goal.create(description: "Pass A6", user_id: 2, status: "public") }
  # let!(:goal4) { Goal.create(description: "Pass A7", user_id: 2) }

  before(:each) do
    sign_up("Joyce")

    make_goal("joyce's private goal", false)
    make_goal("joyce's public goal", true)

    sign_up("Amory")

    make_goal("amory's private goal", false)
    make_goal("amory's public goal", true)

    sign_in("Joyce")
  end

  scenario "shows all of the user's goals and all public goals" do
    expect(page).to have_content("joyce's private goal")
    expect(page).to have_content("joyce's public goal")
    expect(page).to have_content("amory's public goal")
    #save_and_open_page
  end

  scenario "does not show other user's private goals" do
    expect(page).not_to have_content("amory's private goal")
  end

  scenario "displays completed status for completed goals" do
    complete_goal(1)
    expect(page).to have_content("completed")
  end
end
