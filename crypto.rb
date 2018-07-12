require 'rubygems'
require 'nokogiri'   
require 'open-uri'

def names
	arr = []
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")).css(".currency-name-container").each do |names|
		arr.push(names.text)
	end
	return arr
end

def price
	arr = []
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")).css(".price").each do |price|
		arr.push(price.text)
	end
	return arr
end

var = Hash[names.zip(price)]
var.each do |names, price|
	puts "#{names}: #{price}"
end