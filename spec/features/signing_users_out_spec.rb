require "rails_helper"

feature "Signing users out" do
  @john = User.create!(email: "john@example.com",
                     password: "password")
  visit root_path
  click_link "Sign in"
  fill_in "Email", with: @john.email
  fill_in "Password",  with: @john.password
  click_button "Log in"

  scenario do
    visit root_path
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully.")
  end
end
