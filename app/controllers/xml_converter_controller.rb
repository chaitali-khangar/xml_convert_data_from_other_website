class XmlConverterController < ApplicationController
 
 def index
   require 'open-uri'
   base_url = "http://economictimes.indiatimes.com/wealth/insure"
   doc = Nokogiri::HTML(open(base_url))
   result_section = doc.css("#mainContainer").css(".eachStory")
   html = ""
   result_section.each do |result|
   	title_text = result.css('.story-title').text();
  	link_text = base_url+result.css('a').first.attr('href');
  	description_text = result.css(".story-des").text();
    html += "<div class='panel panel-default'><div class='panel-body'><p><h3>#{title_text}</h3><div>#{description_text}<a href=#{link_text}>  continue..</a></div></p></div></div>"
   end
   @html = html
 end
 def home

 end


end
