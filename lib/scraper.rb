require 'open-uri'
require 'nokugiri'

class Scraper
  attr_reader :download

  def initialize url
    download = open(url)

  end

end