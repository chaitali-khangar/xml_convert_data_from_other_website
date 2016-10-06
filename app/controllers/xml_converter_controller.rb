class XmlConverterController < ApplicationController
 
 def index
   require 'open-uri'
   base_url = "http://economictimes.indiatimes.com/wealth/insure"
   doc = Nokogiri::HTML(open(base_url))
   result_section = doc.css("#mainContainer").css(".eachStory")
   rss_feed = "<rss version='2.0'><channel><title>W3Schools Home Page</title><link>http://www.w3schools.com</link><description>RSS Feed</description>"
   result_section.each do |result|
   	title_rss = result.css('.story-title').text();
  	link_rss = base_url+result.css('a').first.attr('href');
  	description_rss = result.css(".story-des").text();
  	rss_feed += "<item><title>"+ title_rss+"</title><link>"+ link_rss+"</link><description>"+description_rss+"</description></item>"
   end
   rss_feed += "</channel></rss>"
   render xml: rss_feed
 end
 def home

 end


end
