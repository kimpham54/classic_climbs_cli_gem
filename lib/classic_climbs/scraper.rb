class ClassicClimbs::Scraper
@@all = []

def self.scrape_sportclimbs(list_url)
	# ClassicClimbs::Scraper.scrape_sportclimbs("https://www.mountainproject.com/area/classics?type=sport")
	climburls = []
	doc = Nokogiri::HTML(open(list_url))
	doc.xpath("//div[@class='table-responsive']/table[1]//tr[@class='route-row']/td/a/@href").each do |ahref|
		item_url = ahref.value
		climburls << item_url
		

# climburls
# ahref.value vs ahref.text
# => ["https://www.mountainproject.com/route/107669530/tachycardia",
#  "https://www.mountainproject.com/route/106701638/playin-hooky",
#  "https://www.mountainproject.com/route/106811013/monkey-off-my-back"]
	end

climburls
self.scrape_item(climburls)

		# .xpath("//td/a/@href").text
# //tr[@class='route-row']/td/a/@href
		
	# doc.xpath("//div[@class='table-responsive']/table[1]//tr[@class='route-row'][1]/td/a/@href").first.value
	
	# .text or .first.value
	# doc.xpath("//div[@class='table-responsive']/table[1]/tbody/tr[1]")
	# //*[@id="classics-page"]/div/div[1]/div[3]/table[1]/tbody/tr[1]
	# doc.search("div.table-responsive/table/tbody").each do |tr|
	# 	item_url = tr.


	# climburls << item_url

# scrapes the front page to get list of climbs

# self.scrape_item

	# climbs
end


def self.scrape_item(url_array)
# scrapes the one level deep page for individual climbs
# "https://www.mountainproject.com/route/107669530/tachycardia"

url_array.each do |url_item|
	doc = Nokogiri::HTML(open(url_item))
	climb = {}
	climb[:name] = doc.xpath("//h1").text.strip
	climb[:grade] = doc.search("h2[class='inline-block mr-2']/span.rateYDS/text()").text.strip
	climb[:type] =  doc.search("table.description-details//tr[1]/td[2]/text()").text.strip
	climb[:url] = doc.xpath('//link[@rel="canonical"]/@href').text.strip
	climb[:description] = doc.xpath("//h2[@class='mt-2'][contains(text(),'Description')]/following-sibling::div[@class='fr-view']").text.strip.gsub("      ", " ").gsub("    ", " ")
	# /text()
	# location
	# refactor type to find next td sibling 
	@@all << climb
	@@all
	# binding.pry


	# doc = Nokogiri::HTML(open(url_item))
	# climb = self.new
	# climb.name = doc.xpath("//h1").text.strip
	# climb.grade = doc.search("h2[class='inline-block mr-2']/span.rateYDS/text()").text.strip
	# climb.type =  doc.search("table.description-details//tr[1]/td[2]/text()").text.strip
	# climb.url = doc.xpath('//link[@rel="canonical"]/@href').text.strip
	# # location = 
	# # refactor type to find next td sibling 
	# @@all << climb
	# @@all
	# binding.pry
	end
end

def self.all
	@@all
end

end