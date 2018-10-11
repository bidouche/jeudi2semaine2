require 'open-uri'
	require 'nokogiri'
	require 'openssl'



def get_all_the_urls_of_val_doise_townhalls
	@arr = []
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	doc.xpath('//p/a').each do |node|
	  @arr << node['href'][1..-1]
	end
end
def get_the_email_of_a_townhal_from_its_webpage(arg)
	@arr2 = []
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{arg}"))
	doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
	 @arr2 << node.text
	end
	print @arr2
end


def perform
	get_all_the_urls_of_val_doise_townhalls
i = 0
while (i < @arr.length)
	get_the_email_of_a_townhal_from_its_webpage(@arr[i])
	i += 1
end	

end
perform