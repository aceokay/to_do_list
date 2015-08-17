require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/tasks")
require("./lib/list")
require('pg')

DB = PG.connect({:dbname => "to_do"})

get("/") do
  @lists = List.all()
  erb(:index)
end

get("/lists/new") do
  erb(:list_form)
end

post("/lists") do
  name = params.fetch("name")
  @list = List.new({:name => name, :id => nil})
  @list.save()
  @lists = List.all()
  erb(:index)
end

post("/tasks") do
  description = params.fetch("description")
  @task = Task.new({:description => description})
  @task.save()
  erb(:success)
end

get('/lists/:id') do
  id = params.fetch("id")
  @list = List.find(id)
  erb(:list)
end
