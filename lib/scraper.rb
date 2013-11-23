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
    twitter = []
    html.search(".back").search("a.twitter").text.split.each do |x|
      if x[0] == "@"
        twitter << x
      end
    end
    twitter
  end

  def get_blog
    blog_url = []
    html.search(".back").each do |back_plate|
      if back_plate.search("a.blog").text == "Blog"
        blog_url << back_plate.search("a.blog")[0]["href"]
      else
        blog_url << "none"
      end
    end
    blog_url
  end

end

# my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
# p my_scraper.get_twitter

  # doesn't work:
  # def get_twitter
  #   twitter = []
  #   html.search(".back").each do |back_plate|
  #     if back_plate.search("a.twitter").text.split[0] == "@"
  #       twitter << x
  #     else
  #       twitter << "none"
  #     end
  #   end
  #   twitter
  # end

 # def get_twitter
 #    twitter = []
 #    html.search(".back").each do |back_plate|
 #      if back_plate.search("a.twitter").text.split[0] == "@"
 #        twitter << back_plate.search("a.twitter").text
 #      else
 #        twitter << "none"
 #      end
 #    end
 #    twitter
 #  end

# def get_twitter
#     mixed_array = html.search("li:first-child a").text.split(" ")
#     twitter_array = []
#     mixed_array.map do |name| 
#       if name[0] == "@"
#         twitter_array << name
#       else
#         twitter_array << "none"
#       end
#     end
#     twitter_array
#   end
