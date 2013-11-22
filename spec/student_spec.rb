require_relative "../lib/student.rb"

student1 = Student.new("Kate", "@fakedonahue", "http://katepdonahue.tumblr.com/")

describe Student do

  describe "#attr_reader" do

    it "should have a method name that can access @name" do
      expect(student1.name).to eq("Kate")
    end

    it "should have a method twitter that can access @twitter" do
      expect(student1.twitter).to eq("@fakedonahue")
    end

    it "should have a method blog that can access @blog" do
      expect(student1.blog).to eq("http://katepdonahue.tumblr.com/")
    end

  end

  describe "#attr_writer" do

    it "should change the value of @name when you call the method name=() with the new name" do
      student1.name = "Flicky"
      expect(student1.name).to eq("Flicky")
    end

    it "should change the value of @twitter when you call the method twitter=() with the twitter" do
      student1.twitter = ("Flicky")
      expect(student1.twitter).to eq("Flicky")
    end

    it "should change the value of @blog when you call the method blog=() with the blog" do
      student1.blog = ("Flicky")
      expect(student1.blog).to eq("Flicky")
    end

  end

end