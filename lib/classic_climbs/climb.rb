class ClassicClimbs::Climb
attr_accessor :name, :grade, :type, :firstascent, :url, :description

@@all = []

def initialize(climb)
	climb.each do |key, value|
      self.send("#{key}=", value)
  end
  @@all << self
# can create an individual climb

end

def self.create_climb(climbs_array)
	climbs_array.each do |climb_hash|
		self.new(climb_hash)
	end
# creates individual climbs from an array of climb hashes, calls on initialize to do that

end

 def self.find(id)
    self.all[id-1]
  end


def self.all
	# puts "Hello"
	@@all
		# 1.Tachycardia - 5.9 - LOCATION1
		# 2.Playin' Hooky - 5.9 - LOCATION1


# climb1 = self.new
# climb1.name = "Tachycardia"
# climb1.grade = "5.8"
# climb1.type = "Sport, 300 ft, 3 pitches"
# # climb1.firstascent = "Matthew Selman, 2012"
# climb1.url = "https://www.mountainproject.com/route/107669530/tachycardia"


# climb2 = self.new
# climb2.name = "Playin' Hooky"
# climb2.grade = "5.9"
# climb2.type = "Sport, 400 ft, 4 pitches"
# # climb2.firstascent = "P1-3, George Bracksieck & Charly Marchand, 1973?, pre-bolts, D. Montgomery & K. McIlrath, 3-18-10"
# climb2.url = "https://www.mountainproject.com/route/106701638/playin-hooky"

# @@all << climb1
# @@all << climb2
# @@all
# [climb1, climb2]

	
end





def self.reset
	self.all.clear
end

end