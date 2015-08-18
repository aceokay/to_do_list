class List

  attr_reader :name, :id

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_lists = DB.exec("SELECT * FROM lists;")
    lists = []
    returned_lists.each do |list|
      name = list.fetch("name")
      id = list.fetch("id").to_i
      lists << List.new({:name => name, :id => id})
    end
    lists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_list|
    self.name() == another_list.name() && self.id == another_list.id
  end

  define_singleton_method(:clear) do
    DB.exec("DELETE FROM lists *;")
  end

  define_singleton_method(:find) do |ident|
    found_list = nil
    List.all.each do |list|
      found_list = list if list.id == ident
    end
    found_list
  end

  define_method(:tasks) do
    list_tasks = []
    returned_tasks = DB.exec("SELECT * FROM tasks WHERE list_id = #{self.id};")
    returned_tasks.each do |task|
      description = task.fetch("description")
      list_id = task.fetch("list_id").to_i
      due_date = task.fetch("due_date")
      list_tasks << Task.new({:description => description, :list_id => list_id, :due_date => due_date})
    end
    list_tasks
  end

  define_method(:list_clear) do
    DB.exec("DELETE FROM tasks * WHERE list_id = #{self.id};")
  end


end
