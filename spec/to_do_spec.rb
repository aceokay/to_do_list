require('rspec')
require('to_do')
require('pg')

DB = PG.connect({:dbname => to_do_test})

describe (Task) {
  before() {
    Task.clear()
  }

  describe ('#description') {
    it("lets you give it a description of a task") {
      test_task = Task.new("make me coffee")
      expect(test_task.description).to(eq("make me coffee"))
    }
  }

  describe ('.all') {
    it ("is empty at first") {
      expect(Task.all).to(eq([]))
    }
  }
  describe ('#save') {
    it ("adds a task to the array of saved tasks") {
        new_task = Task.new("water the cactus")
        new_task.save()
        expect(Task.all()).to(eq([new_task]))
      }
  }
  describe('.clear') {
    it ("clears the list of tasks that were saved") {
      new_task = Task.new("feed the midget")
      new_task.save
      Task.clear
      expect(Task.all).to(eq([]))
    }
  }

}
