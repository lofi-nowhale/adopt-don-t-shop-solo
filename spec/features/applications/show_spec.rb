require 'rails_helper'

RSpec.describe "Application Show Page" do
  before (:each) do
    @application_1 = Application.create!(name: "P Sherman", street_address: "42 Wallaby Way", city: "Sydney", state: "NSW", zipcode: "2307", description: "best pet parent duh")

    @application_2 = Application.create!(name: "Clifford Red", street_address: "123 Greenwich", city: "New York City", state: "NY", zipcode: "10001", description: "10/10 pet parent duh")

    
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
    expect(page).to have_content(@application_1.pets)
  end
end