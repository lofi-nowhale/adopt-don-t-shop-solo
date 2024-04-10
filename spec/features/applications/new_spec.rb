require 'rails_helper'

RSpec.describe "New Application page" do
  before (:each) do
    load_test_data
  end

  it "should have fields for the applicant details and a button to submit the application" do
    visit "/applications/new"

    expect(page).to have_field("name")
    expect(page).to have_field("street_address")
    expect(page).to have_field("city")
    expect(page).to have_field("state")
    expect(page).to have_field("zipcode")
    expect(page).to have_field("description")

    expect(page).to have_button("Submit Application")
  end

  it "redirects to the application show page once submitted and reflects that the application is 'in progress'" do
    visit "/applications/new"
    
    fill_in 'name', with: "#{@application_1.name}"
    fill_in 'street_address', with: "#{@application_1.street_address}"
    fill_in 'city', with: "#{@application_1.city}"
    fill_in 'state', with: "#{@application_1.state}"
    fill_in 'zipcode', with: "#{@application_1.zipcode}"
    fill_in 'description', with: "#{@application_1.description}"
    save_and_open_page
    click_button("Submit Application")

    new_app = Application.last

    expect(page).to have_current_path("/applications/#{new_app.id}")

    expect(page).to have_content("In Progress")
  end
end