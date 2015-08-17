require('spec_helper')

describe(Task) {

  describe('#==') {
    it("is the same task if it has the same description") {
      task_1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2015-08-17 00:00:00'})
      task_2 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2015-08-17 00:00:00'})
      expect(task_1).to(eq(task_2))
    }
  }

  describe ('#description') {
    it("lets you give it a description of a task") {
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2015-08-17 00:00:00'})
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
        test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2015-08-17 00:00:00'})
        test_task.save()
        expect(Task.all()).to(eq([test_task]))
      }
  }

  describe("#list_id") do
    it("lets you read the list_id out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2015-08-17 00:00:00'})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe("#due_date") do
    it("will return the due date of the task") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2015-08-17 00:00:00'})
      test_task.save()
      expect(test_task.due_date()).to(eq('2015-08-17 00:00:00'))
    end

    it("will return the list of tasks in order of due date") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2015-08-17 00:00:00'})
      test_task.save()
      test_task_2 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2015-08-13 00:00:00'})
      test_task_2.save()
      expect(Task.all).to(eq([test_task_2, test_task]))
    end
  end

  describe('.clear') {
    it ("clears the list of tasks that were saved") {
      new_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2015-08-17 00:00:00'})
      new_task.save
      Task.clear
      expect(Task.all).to(eq([]))
    }
  }

}
