require "httparty"
require "nokogiri"
require "json"
require "pry"
require 'csv'




#No of Questions Solved
url = 'https://www.codechef.com/users/'
id = 'aman8050'
url = url + id
page1 = HTTParty.get(url)
parse_page1 = Nokogiri:: HTML(page1)

print "No of Ques Solved: "

parse_page1.css('.sidebar-right').css('.maintable').css('.content').css('.wrapper').css('.inner-wrapper').css('.rounded-cr-header').css('.rounded-cr-footer').css('.cols-2').css('.content-wrapper').css('.profile').map do |a|
	print a.css('table#problem_stats').css('tr')[1].css('td')[0].text
end


