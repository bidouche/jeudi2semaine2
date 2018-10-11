

require 'open-uri'
	require 'nokogiri'
	require 'openssl'

def get_name_surname
    @name = []
    @first_name =[]
    @family_name = []
    doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    doc.xpath("//div[@id='deputes-list']//a").each do |node|
    @name << node.text
end
    @name.each do |x| @first_name << x.split(' ')[1]
    end
    @name.each do |x| @family_name << x.split(' ')[2..-1]
    end
    print @first_name
    print @family_name
end
get_name_surname