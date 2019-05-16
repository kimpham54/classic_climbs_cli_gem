# refactoring options:
# 1. in self.scrape_item, if xpath doesn't find a value, leave out of hash instead of saying "not available"
# 2. clean up description, format nicely or truncate with option to view entire description

class ClassicClimbs::Scraper
@@all = []

# test in .bin/console with ClassicClimbs::Scraper.scrape_sportclimbs("https://www.mountainproject.com/area/classics?type=sport")
# climburls = ["https://www.mountainproject.com/route/107669530/tachycardia",
#  "https://www.mountainproject.com/route/106701638/playin-hooky",
#  "https://www.mountainproject.com/route/106811013/monkey-off-my-back"]
def self.scrape_sportclimbs(list_url)
	climburls = []
	doc = Nokogiri::HTML(open(list_url))
	doc.xpath("//div[@class='table-responsive']/table[1]//tr[@class='route-row']/td/a/@href").each do |ahref|
		item_url = ahref.value
		climburls << item_url
	end

climburls
self.scrape_item(climburls)
end


# scrapes the one level deep page for individual climbs
# climb = {:name=>"Playin' Hooky",
  # :grade=>"5.8",
  # :type=>"Sport, 400 ft, 4 pitches",
  # :url=>"https://www.mountainproject.com/route/106701638/playin-hooky",
  # :description=>
  #  "Finally! A mega moderate that graces the slabs of Creekside....."}
def self.scrape_item(url_array)
url_array.each do |url_item|
	doc = Nokogiri::HTML(open(url_item))
	climb = {}
	climb[:name] = doc.xpath("//h1").text.strip
	climb[:grade] = doc.search("h2[class='inline-block mr-2']/span.rateYDS/text()").text.strip
	climb[:type] =  doc.search("table.description-details//tr[1]/td[2]/text()").text.strip
	climb[:url] = doc.xpath('//link[@rel="canonical"]/@href').text.strip
	climb[:description] = doc.xpath("//h2[@class='mt-2'][contains(text(),'Description')]/following-sibling::div[@class='fr-view']").text.strip.gsub("      ", " ").gsub("    ", " ")

	if climb[:name] == ""
		climb[:name] = "No name available."
	end
	if climb[:grade] == ""
		climb[:grade] = "No grade available."
	end
	if climb[:type] == ""
		climb[:type] = "No type available."
	end
	if climb[:url] == ""
		climb[:url] = "No url available."
	end
	if climb[:description] == ""
		climb[:description] = "No description available."
	end

	@@all << climb
	@@all
	end
end

def self.all
	@@all
end

end