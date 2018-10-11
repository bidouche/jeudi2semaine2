require 'open-uri'
	require 'nokogiri'
	cryptoname = []
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	doc.xpath('//td[3]').each do |node|
	  cryptoname << node.text
	end
	cryptoprice = []
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	doc.xpath('//td[5]/a').each do |node|
	   cryptoprice << node.text
	end

	myhash = {}
	cryptoname.zip(cryptoprice) {|a, b| myhash[a] = b}

	puts myhash