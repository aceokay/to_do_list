require('spec_helper')

describe(Task) {

  describe('#==') {
    it("is the same task if it has the same description") {
      task_1 = Task.new({:description => "learn SQL", :list_id => 1})
      task_2 = Task.new({:description => "learn SQL", :list_id => 1})
      expect(task_1).to(eq(task_2))
    }
  }

  describe ('#description') {
    it("lets you give it a description of a task") {
      test_task = Task.new({:description => "learn SQL", :list_id => 1})
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
        test_task = Task.new({:description => "learn SQL", :list_id => 1})
        test_task.save()
        expect(Task.all()).to(eq([test_task]))
      }
  }

  describe("#list_id") do
    it("lets you read the list_id out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  # describe('.clear') {
  #   it ("clears the list of tasks that were saved") {
  #     new_task = Task.new("feed the midget")
  #     new_task.save
  #     Task.clear
  #     expect(Task.all).to(eq([]))
  #   }
  # }

}
