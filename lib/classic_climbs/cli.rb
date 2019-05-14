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
	puts("list of climbs go here")
	ClassicClimbs::Climb.reset
	ClassicClimbs::Scraper.scrape_sportclimbs("https://www.mountainproject.com/area/classics?type=sport")
	ClassicClimbs::Climb.create_climb(ClassicClimbs::Scraper.all)
	@list = ClassicClimbs::Climb.all
	@list.each.with_index(1) do |item, index|
		puts("#{index}. #{item.name} - #{item.grade}")
	end
	puts "------------------------------Climbs Sub-Menu-----------------------------"
	puts "Which climb do you want to learn more about? enter a #"

	# puts "Type 'random' if you want a random climb"

	puts "Type grade if you want to see climbs by grade"
	puts "--------------------------------------------------------------------------"
	end


def menu
	input = nil
	
	while input != "exit"
	puts "\n"
	puts "--------------------------------Main Menu-------------------------------"
	puts "Enter the climb # you want to learn more about"
	puts "Type 'exit' to quit the program"
	puts "Type 'list' to get the list of climbs"
	puts "------------------------------------------------------------------------"
	puts "\n\n\n"

		input = gets.strip.chomp.downcase
		# if input.to_i > 0

		case input
		when "list"
			list_climbs
		when "exit"
			puts "Goodbye. Happy climbing!"
		else
			puts "not valid entry"
		end
	end
end


end

