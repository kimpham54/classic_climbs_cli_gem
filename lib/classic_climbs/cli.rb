class ClassicClimbs::CLI

def call
	puts "\n"
	puts "---------------------Classic Climbs for All Locations---------------------"
	puts "This is Mountain Project's determination of the most popular, highly-rated routes."
	puts "--------------------------------------------------------------------------"
	puts "\n\n\n"
	self.menu
end

def list_climbs
	# puts("list of climbs go here")
	# how to avoid crawling to create @list again if it's been crawled?
	@list = ClassicClimbs::Climb.all
	if @list.empty? == true
	# ClassicClimbs::Climb.reset
	ClassicClimbs::Scraper.scrape_sportclimbs("https://www.mountainproject.com/area/classics?type=sport")
	ClassicClimbs::Climb.create_climb(ClassicClimbs::Scraper.all)
	@list.each.with_index(1) do |item, index|
		puts("#{index}. #{item.name} - #{item.grade}")
	end
	else
		@list.each.with_index(1) do |item, index|
		puts("#{index}. #{item.name} - #{item.grade}")
		# don't crawl again and take forever
	end
end
	self.sub_menu
	
	# input = nil
	# if input.to_i > 0
	end

def sub_menu
	puts "\n"
	puts "------------------------------Climbs Sub-Menu-----------------------------"
	puts "Type the climb # you want to learn more about, e.g. '5'."

	# puts "Type 'random' if you want a random climb"

	puts "Type 'grade' if you want to see climbs by grade"
	puts "--------------------------------------------------------------------------"
end

def main_menu
	puts "\n"
	puts "--------------------------------Main Menu-------------------------------"
	puts "Type 'list' to get the list of climbs"
	puts "Type 'exit' to quit the program"
	puts "------------------------------------------------------------------------"
	puts "\n"
end



def menu
	input = nil
	
	while input != "exit"
		self.main_menu	

		input = gets.strip.chomp.downcase
		# 
		if input == "list"
			list_climbs
		elsif input.to_i > 0 && input.to_i < ClassicClimbs::Climb.all.length
			climbinfo = ClassicClimbs::Climb.find(input.to_i)
			print_climb(climbinfo)
		elsif input.to_i > ClassicClimbs::Climb.all.length
			puts "Sorry, not a valid entry. There aren't that many climbs in the list!"
		elsif input == "exit"
			puts "Goodbye. Happy climbing!"
		else
			puts "Sorry, not a valid entry"
		end

		# case input
		# when "list"
		# 	list_climbs
		# when "exit"
		# 	puts "Goodbye. Happy climbing!"
		# else
		# 	puts "not valid entry"
		# end
	end
end

def print_climb(climb)
	puts ""
    puts "Name:     #{climb.name}"
    puts "Grade:    #{climb.grade}"
    puts "Type:     #{climb.type}"
    puts "URL:      #{climb.url}"
    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "#{climb.description}"
    puts ""
end

end

