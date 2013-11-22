require './lib/scraper'
require './lib/student'

# make a new instance of the class scraper

my_scraper = Scraper.new "http://flatironschool-bk.herokuapp.com/"

# get the student names from the scraper

students = my_scraper.get_students_names

# get the blogs

blogs = my_scraper.get_blog

# get the twitter

twitters = my_scraper.get_twitter

# make a new student object for each person
our_class = []
28.times do |i|
  our_class << Student.new(students[i], twitters[i], blogs[i])
end

our_class.each do |classmate|
  puts "Name: #{classmate.name} Twitter: #{classmate.twitter} Blog: #{classmate.blog}"
end
