require_relative "../lib/student.rb"

student1 = Student.new("Kate", "@fakedonahue", "http://katepdonahue.tumblr.com/")

describe Student do

  describe "#attr_reader" do

    it "should have a method name that can access @name" do
      expect(Student.new.name).to eq(@name)
    end

    it "should have a method twitter that can access @twitter" do
      expect(Student.new.twitter).to eq(@twitter)
    end

    it "should have a method blog that can access @blog" do
      expect(Student.new.blog).to eq(@blog)
    end

  end

  describe "#attr_writer" do

    it "should change the value of @name when you call the method name=() with the new name" do
      expect(student1.name=("Flicky").name).to eq("Flicky")
    end

    it "should raise an error if no new name is given when you call the method name=" do
      expect(student1.name=()).to raise_error
    end

    it "should change the value of @twitter when you call the method twitter=() with the twitter" do
      expect(student1.twitter=("Flicky").twitter).to eq("Flicky")
    end

    it "should raise an error if no twitter is given when you call the method twitter=" do
      expect(student1.twitter=()).to raise_error
    end

    it "should change the value of @blog when you call the method blog=() with the blog" do
      expect(student1.blog=("Flicky").blog).to eq("Flicky")
    end

    it "should raise an error if no blog is given when you call the method blog=" do
      expect(student1.blog=()).to eq("Flicky")
    end

  end

  describe "#initialize" do

    it "should raise an error when you try to make a student without params" do
      expect(Student.new).to raise_error
    end

    # it "should assign the parameter to @name if you only give it one" do
    #   expect(Student.new("Kate").name).to eq("Kate")
    # end

    # it "should assign the first parametr to @name and the second to either twitter or blog depending on it's form if only passed two params" do
    #   expect(Student.new("Kate", "http://katepdonahue.tumblr.com/").name).to eq("Kate")
    #   expect(Student.new("Kate", "http://katepdonahue.tumblr.com/").blog).to eq("http://katepdonahue.tumblr.com/")
    #   expect(Student.new("Kate", "http://katepdonahue.tumblr.com/").twitter).to be_nil
    # end

    # repetitive of attr_reader method tests
    it "should assign the first parametr to @name, the second to twitter, and the third blog" do
      expect((student1).name).to eq("Kate")
      expect((student1).blog).to eq("http://katepdonahue.tumblr.com/")
      expect((student1).twitter).to eq("@fakedonahue")
    end

  end  
  
  

end