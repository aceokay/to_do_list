require('spec_helper')

describe(List) do
  describe(".all") do
    it("starts off with no lists") do
      expect(List.all()).to(eq([]))
    end
  end

  describe('#name') do
    it("returns the name of a list") do
      test_list = List.new({:name => "movies", :id => nil})
      expect(test_list.name).to(eq("movies"))
    end
  end

  describe('#id') do
    it("sets its id when you save it") do
      test_list = List.new({:name => "movies", :id => nil})
      test_list.save
      expect(test_list.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#save') do
    it("saves a list to the database") do
      test_list = List.new({:name => "movies", :id => nil})
      test_list.save
      expect(List.all()).to(eq([test_list]))
    end
  end

  describe('#==') {
    it("is the same list if it has the same name") {
      test_list = List.new({:name => "movies", :id => nil})
      test_list_2 = List.new({:name => "movies", :id => nil})
      expect(test_list).to(eq(test_list_2))
    }
  }

  describe('#save') do
    it("saves a list to the database") do
      test_list = List.new({:name => "movies", :id => nil})
      test_list.save
      List.clear
      expect(List.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("finds a list by its id number") do
      test_list = List.new({:name => "movies", :id => nil})
      test_list.save
      test_list_2 = List.new({:name => "chores", :id => nil})
      test_list_2.save
      expect(List.find(test_list.id)).to(eq(test_list))
    end
  end

  describe("#tasks") do
    it("will list the tasks for that specific list") do
      test_list = List.new({:name => "movies", :id => nil})
      test_list.save()
      task_1 = Task.new({:description => "learn SQL", :list_id => test_list.id(), :due_date => '2015-08-16 00:00:00'})
      task_1.save()
      task_2 = Task.new({:description => "learn Ruby", :list_id => test_list.id(), :due_date => '2015-08-17 00:00:00'})
      task_2.save()
      task_3 = Task.new({:description => "learn ember", :list_id => 2, :due_date => '2015-08-17 00:00:00'})
      task_3.save()
      expect(test_list.tasks()).to(eq([task_1, task_2]))
    end
  end

end
