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
    expect(page).to have_content("Epicodus work")
  end

  # it("allows user to add task to a list") do
  #   visit("/")
  #   click_link("Create New List")
  #   fill_in('name', :with => "Epicodus work")
  #   click_button("Add List")
  #   click_link("Epicodus work")
  #   expect(page).to have_content("Create a new task")
  #   fill_in('description', :with => 'Commit the details')
  #   fill_in('due_date', :with => "2015-07-16")
  #   click_button('Add Task')
  #   expect(page).to have_content("Commit the details")
  # end

  it("allows a user to delete a specific instance of List") do
    visit("/")
    click_link("Create New List")
    fill_in('name', :with => "Epicodus work")
    click_button("Add List")
    click_link("X")
    expect(page).to_not have_content("Epicodus work")
  end
end

# describe("/tasks", {:type => :feature}) do
#   it("allows the user to add a new task") do
#     test_list = List.new({:name => "Chores", :id => nil})
#     test_list.save
#     visit("/lists/#{test_list.id}")
#     fill_in("description", :with => "Clean Room")
#     fill_in("due_date", :with => "2015-07-16")
#     click_button("Add Task")
#     expect(page).to have_content("Clean Room")
#   end
#
#   it("allows a user to delete a specific instance of Task") do
#     visit("/")
#     click_link("Create New List")
#     fill_in('name', :with => "Epicodus work")
#     click_button("Add List")
#     click_link("Epicodus work")
#     fill_in('description', :with => 'Commit the details')
#     fill_in('due_date', :with => "2015-07-16")
#     click_button('Add Task')
#     click_link('X')
#     expect(page).to_not have_content("Commit the details")
#   end
# end
