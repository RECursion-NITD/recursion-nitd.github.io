require "httparty"
require "nokogiri"
require "json"
require "pry"
require 'csv'

page = HTTParty.get('https://www.codechef.com/contests')

parse_page = Nokogiri::HTML(page)


##Present Contests Scraping of Codechef
print "PRESENT CONTESTS\n" 
i = 0
events_array = []
parse_page.css('.content').css('.wrapper').css('.inner-wrapper').css('.rounded-cr-header').css('.rounded-cr-footer').css('#primary-content').css('.content-wrapper').css('.dataTable')[0].css('tbody').map do |a|
	event =  a.css('td').css('a').length
	
	while i < event do
		print a.css('td').css('a')[i].text + '   ' + "http://www.codechef.com"+ a.css('td').css('a')[i]['href']
		print "\n"
		i += 1
	end
	 
end

print "FUTURE CONTESTS\n"
j = 0
events_array1 = []
parse_page.css('.content').css('.wrapper').css('.inner-wrapper').css('.rounded-cr-header').css('.rounded-cr-footer').css('#primary-content').css('.content-wrapper').css('.dataTable')[1].css('tbody').map do |a|
	event1 =  a.css('td').css('a').length
	
	while j < event1 do
		print a.css('td').css('a')[j].text + '   ' + "http://www.codechef.com"+ a.css('td').css('a')[j]['href']
		print "\n"
		j += 1
	end
	 
end

