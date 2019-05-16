# refactoring options
# 1. ClassicClimbs::Climb.reset if you want to do a recrawl
# 2. to change url if you need to someday, put variable in environment.rb
class ClassicClimbs::CLI

def call
	puts "\n"
	puts "---------------------Classic Climbs for All Locations---------------------"
	puts "This is Mountain Project's determination of the most popular, highly-rated routes."
	puts "--------------------------------------------------------------------------"
	puts "\n\n\n"
	self.menu
end


# takes a while, ~60 seconds
# $list_climbs
# 1.Tachycardia - 5.9
# 2.Playin' Hooky - 5.9
def list_climbs
	sporturl = "https://www.mountainproject.com/area/classics?type=sport"
	@list = ClassicClimbs::Climb.all
	if @list.empty? == true
	ClassicClimbs::Scraper.scrape_sportclimbs(sporturl)
	ClassicClimbs::Climb.create_climb(ClassicClimbs::Scraper.all)
	@list.each.with_index(1) do |item, index|
		puts("#{index}. #{item.name} - #{item.grade}")
	end
	else
		# avoid crawling again if it's been crawled the first time
		@list.each.with_index(1) do |item, index|
		puts("#{index}. #{item.name} - #{item.grade}")
	end
end
	self.sub_menu
	end

def sub_menu
	puts "\n"
	puts "------------------------------Climbs Sub-Menu-----------------------------"
	puts "Type the climb # you want to learn more about, e.g. '5'."
	# puts "Type 'grade' if you want to see climbs by grade"
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
	end
end


# $print_climb(climb)
# Name:     Namaste
# Grade:    5.11d
# Type:     Sport, 140 ft
# URL:      https://www.mountainproject.com/route/105717892/namaste

# ---------------Description--------------

# If you've seen images of this, you need to hike in and climb it. It is one of the coolest desert sport routes I've done.  Most of the holds are big and none of the moves are hard, but by the end, you're getting pumped. I think there might be a kneebar somewhere around mid-height to shake out. Getting down from Huecos Rancheros and Namaste is a little tricky if you are leading and cleaning since you need two ropes and the routes are very steep.
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

