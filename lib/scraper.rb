require 'open-uri'
require 'pry'

class Scraper
@@students = []

  def self.scrape_index_page(index_url)
    doc = open(index_url)
    info = Nokogiri::HTML(doc)
    #scrape page for css selector that points to students
    #add students to @@students array as a hash
    #hash should have the keys :name, :location, :profile_url
    info.css(".student-card").each do |student_card|
      student_hash = {}
      student_hash[:name] = student_card.css(".card-text-container h4.student-name").text
      student_hash[:location] = student_card.css(".card-text-container p.student-location").text
      student_hash[:profile_url] = "https://learn-co-curriculum.github.io/student-scraper-test-page/" + "#{student_card.css("a").attribute("href").value}"
      #binding.pry
      @@students << student_hash
      #binding.pry
    end
  end

  def self.scrape_profile_page(profile_url)
    
  end
  
  def self.students
    @@students
  end

end

