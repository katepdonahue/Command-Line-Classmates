require 'launchy'
require './lib/scraper'
require './lib/student'

class App
  attr_reader :names, :twitters, :blogs

  def initialize
    my_scraper = Scraper.new "http://flatironschool-bk.herokuapp.com/"
    @names = my_scraper.get_students_names
    @twitters = my_scraper.get_twitter
    @blogs = my_scraper.get_blog
  end

  def generate_directory
    our_class = []
    28.times do |i|
      our_class << Student.new(names[i], twitters[i], blogs[i])
    end
    our_class
  end

  def directory
    generate_directory.each do |classmate|
      puts "Name: #{classmate.name},  Twitter: #{classmate.twitter}, Blog: #{classmate.blog}\n"
    end
  end

  def random_blog
    Launchy.open("#{blogs.sample}")
  end

  def random_twitter
    Launchy.open("twitter.com/#{twitters.sample[1..-1]}")
  end

  def blog(stu_name)
    generate_directory.each do |student_object|
      if student_object.name.start_with?(stu_name)
        Launchy.open("#{student_object.blog}")
      end
    end
  end

  def twitter(stu_name)
    generate_directory.each do |student_object|
      if student_object.name.start_with?(stu_name)
        Launchy.open("twitter.com/#{student_object.twitter[1..-1]}")
      end
    end
  end

end

# app1 = App.new
# app1.blog("Kate")

# twitters matching up but I already knew that would happen... going to fix this




