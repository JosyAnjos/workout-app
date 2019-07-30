require 'rails_helper'

RSpec.feature 'Creating Challenge' do
  before do
    @john = User.create(email: "john@exemple.com", password: "password")
    login_as(@john)
  end
  scenario "with valid inputs" do 
    visit root_path

    click_on "My Lounge"
    click_on "New Challenge"
    expect(page).to have_link("Back")

    fill_in "Duration", with:70
    fill_in "Challenge Details", with: "Read new book"
    fill_in "Activity date", with: "2016-07-26"
    click_button "Create Challenge"

    expect(page).to have_content("Challenge has been created")
    
    challenge = Challenge.last
    expect(current_path).to eq(user_challenge_path(@john,challenge))
    expect(challenge.user_id).to eq(@john.id)
  end  
end