require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    scraped_students = []
    info = Nokogiri::HTML(open(index_url))
 
    info.css(".student-card").each do |student_card|
      name = student_card.css(".card-text-container h4.student-name").text
      location = student_card.css(".card-text-container p.student-location").text
      url = student_card.css("a").attribute("href").value
      scraped_students << {name: name, location: location, profile_url: url}
    end
    scraped_students
  end
  
  
  def self.scrape_profile_page(profile_url)
    page = Nokogiri::HTML(open(profile_url))
    twitter =
    linkedin =
    github = 
    blog = 
    quote = 
    
    student_info = {twitter: twitter, linkedin: linkedin, github: github, blog: blog, quote: quote}
    student_info
  end
  

end

