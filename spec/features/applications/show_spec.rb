require 'rails_helper'

RSpec.describe "Application Show Page" do
  before (:each) do
    load_test_data
  end

  it "displays the applicant's deatils" do
    visit "/applications/#{@application_1.id}"

    expect(page).to have_content(@application_1.name)
    expect(page).to have_content(@application_1.street_address)
    expect(page).to have_content(@application_1.city)
    expect(page).to have_content(@application_1.state)
    expect(page).to have_content(@application_1.zipcode)
    expect(page).to have_content(@application_1.description)
    expect(page).to have_content(@application_1.status)
  end

  it "displays the details of the pets associated with that application" do
    visit "/applications/#{@application_1.id}"

    expect(page).to have_content(@application_1.pets.first.name)
    expect(page).to have_content(@application_1.pets.last.name)
  end
end