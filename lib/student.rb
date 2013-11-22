# create a student class to store this info
# start with test
class Student
  attr_accessor :name, :twitter, :blog

  def initialize(name, twitter, blog)
    @name = name
    @twitter = twitter
    @blog = blog
  end

end