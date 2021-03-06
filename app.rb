require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/tasks")
require("./lib/list")
require('pg')

DB = PG.connect({:dbname => "todo"})

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
  due_date = params.fetch("due_date")
  list_id = params.fetch("list_id").to_i
  @list = List.find(list_id)
  @task = Task.new({:description => description, :due_date => due_date, :list_id => list_id})
  @task.save()
  @tasks = @list.tasks
  erb(:list)
end

get('/lists/:id') do
  id = params.fetch("id").to_i
  @list = List.find(id)
  @tasks = @list.tasks
  erb(:list)
end

post("/clear_list") do
  erb(:list)
end

get("/lists/:id/delete") do
  id = params.fetch('id').to_i()
  list_to_delete = List.find(id)
  list_to_delete.delete_list()
  @lists = List.all()
  erb(:index)
end

get("/lists/:id/delete/:description") do
  id = params.fetch('id').to_i
  description = params.fetch('description').gsub(" ", "_")
  @list = List.find(id)
  task_to_delete = @list.find_task(description)
  task_to_delete.delete_task
  @tasks = @list.tasks
  erb(:list)
end

get("/lists/:id/edit") do
  @list = List.find(params.fetch("id").to_i())
  erb(:list_edit)
end

patch("/lists/:id") do
  name = params.fetch("name")
  @list = List.find(params.fetch("id").to_i())
  @list.update({:name => name})
  erb(:list)
end
