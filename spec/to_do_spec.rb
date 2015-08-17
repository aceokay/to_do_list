require('rspec')
require('to_do')
require('pg')

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end

describe(Task) {

  describe('#==') {
    it("is the same task if it has the same description") {
      task_1 = Task.new({:description => "learn SQL"})
      task_2 = Task.new({:description => "learn SQL"})
      expect(task_1).to(eq(task_2))
    }
  }

  describe ('#description') {
    it("lets you give it a description of a task") {
      test_task = Task.new({:description => "learn SQL"})
      expect(test_task.description).to(eq("learn SQL"))
    }
  }

  describe ('.all') {
    it ("is empty at first") {
      expect(Task.all).to(eq([]))
    }
  }
  describe ('#save') {
    it ("adds a task to the array of saved tasks") {
        test_task = Task.new({:description => "learn SQL"})
        test_task.save()
        expect(Task.all()).to(eq([test_task]))
      }
  }
  # describe('.clear') {
  #   it ("clears the list of tasks that were saved") {
  #     new_task = Task.new("feed the midget")
  #     new_task.save
  #     Task.clear
  #     expect(Task.all).to(eq([]))
  #   }
  # }

}
