require "rails_helper"

RSpec.feature "User can login", type: :feature, js: true do
  before :each do
    User.create!(:name => "Test Name", :email => "test@test.com", :password => "acb12345", :password_confirmation => "acb12345")
  end

  scenario "User can login with their email/pass" do
    visit login_path

    fill_in "email", with: "test@test.com"
    fill_in "password", with: "acb12345"

    click_button("Submit")
    # save_screenshot

    expect(page).to have_content("Logged in")
  end
end
