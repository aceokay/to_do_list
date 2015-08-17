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

describe("/tasks", {:type => :feature}) do
  it("allows the user to add a new task") do
    test_list = List.new({:name => "Chores", :id => nil})
    test_list.save
    visit("/lists/#{test_list.id}")
    fill_in("description", :with => "Clean Room")
    fill_in("due_date", :with => "2015-07-16")
    click_button("Add Task")
    expect(page).to have_content("Clean Room")
  end
end
