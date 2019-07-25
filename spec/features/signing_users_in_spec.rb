require "rails_helper"

feature "Users signin" do
  @josy = User.create!(email: "josy@example.com", password: "password")

  scenario "with valid credentials" do
    visit root_path
    click_link "Sign in"

    fill_in "Email", with: @josy.email

    fill_in "Password",  with: @josy.password

    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")

    expect(page).to have_content("Signed in as #{@josy.email}")
  end
end
