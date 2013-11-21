# require the libraries we need
require 'open-uri' # open the file on the internet
require 'nokogiri' # line10 

class Scraper
  attr_reader :html

  def initialize url
    download = open(url)
    @html = Nokogiri::HTML(download)
  end

  def get_students_names
    html.search("h3").text.split(/(?<=[a-z.])(?=[A-Z])/)
  end

  def get_twitter
    mixed_array = html.search("li:first-child a").text.split(" ")
    twitter_array = mixed_array.select { |name| name[0] == "@"}
  end

  def get_blog
    blog_url = []
    19.times do |i|
      blog_url << html.search("a.blog")[i]["href"]
    end
    blog_url
  end

end

my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
puts my_scraper.get_students_names