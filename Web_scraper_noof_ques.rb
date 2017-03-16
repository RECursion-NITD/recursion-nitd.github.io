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

print "No of Ques Solved on Codechef: "

parse_page1.css('.sidebar-right').css('.maintable').css('.content').css('.wrapper').css('.inner-wrapper').css('.rounded-cr-header').css('.rounded-cr-footer').css('.cols-2').css('.content-wrapper').css('.profile').map do |a|
	print a.css('table#problem_stats').css('tr')[1].css('td')[0].text
end

print "\n"

#No of Questions on SPOJ
url1 = 'http://www.spoj.com/users/'
id1 = 'aman8050'
url1 = url1 + id1
page2 = HTTParty.get(url1)
parse_page2 = Nokogiri:: HTML(page2)

print "No of Ques Solved on SPOJ: "

print parse_page2.css('.content').css('.container').css('.row').css('.col-md-9').css('.col-md-12').css('.row').css('.col-md-6').css('.dl-horizontal').search('dd')[0].text