require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("/lists", {:type => :feature}) do
  it("allows the user to add a new list") do
    visit("/")
    click_link("Create New List")
    fill_in('name', :with => "Epicodus work")
    click_button("Add List")
    expect(page).to have_content("To Do List")
  end
end
