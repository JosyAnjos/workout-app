require "rails_helper"

feature "User signup" do
  scenario "with valid credentials" do
    visit root_path
    click_link "Sign up"
    fill_in "First name", with:"john"
    fill_in "Last name", with:"Doe"
    fill_in "Email", with:"john@exemple.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    #expect(page). have_content("You have signed up successfully.")
    
    user = User.last
    room = user.room
    room_name = user.full_name.split.join('-')
    expect(room.name).to eq (room_name)

    visit "/"
    expect(page).to have_content("john Doe")
  end

  scenario "with invalid credentials" do
    visit "/"

    click_link "Sign up"
    fill_in "First name", with: ""
    fill_in "Last name", with: ""
    fill_in "Email", with: "john@example.com"
    fill_in "Password",  with: "password"
    fill_in "Password confirmation",  with: "password"
    click_button "Sign up"

    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
  end
end
