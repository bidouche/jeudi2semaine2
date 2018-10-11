require 'open-uri'
	require 'nokogiri'
	require 'openssl'
	require 'pry'


def get_all_the_urls_of_val_doise_townhalls
	@arr = []
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	doc.xpath('//p/a').each do |node|
	  @arr << node['href'][1..-1]
	end
end

def nomville
	@arr3 = []
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	doc.xpath('//p/a').each do |node|
	  @arr3 << node.text
	end
end
def get_the_email_of_a_townhal_from_its_webpage(arg)
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{arg}"))
	return doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')[0].text

end


def perform
	nomville
	get_all_the_urls_of_val_doise_townhalls
	@arr2 = []
@arr.each do |url|
	@arr2 << get_the_email_of_a_townhal_from_its_webpage(url)

end
end

	


def methode
	perform
	myhash = {}
	@arr3.zip(@arr2) {|a, b| myhash[a] = b}

	puts myhash
end
methode
