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

end
